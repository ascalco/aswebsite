
# PACKAGES ----------------------------------------------------------------

library(tidyverse)
library(readxl)
library(hrbrthemes)
library(psych)
# mnormt for R 3.6.3 -- required for psych and lavaan packages
#devtools:: install_version("mnormt", version = "1.5-5", repos = "http://cran.us.r-project.org")

# DATA --------------------------------------------------------------------
 

SUS_data <- readxl::read_xlsx("Khan-SUS_analysis.xlsx",
                  col_names = TRUE)


# inspect
#view(SUS_data)
str(SUS_data)
head(SUS_data)
tail(SUS_data)


# DATA FORMAT FOR SHINY APP -----------------------------------------------

'The SUS must be formatted in the following way:
  - each row is a case (i.e. a user)
  - each column is a variable
  - questions must be named question1, question2, ..., question10
    (Tip. If you are using Excel, then write the name of the first two questions,
    select both of them, and than drag the cells: Excel will automatically created the next column names)
  - the first row of the excel file must contain the names of the columns

Some additional variables are accepted, for the moment they are limited to:
  age of users (column name must be "age")
  gender of users (column name must be "gender").

The order of the columns does not affect the analysis.

NB: You might want to add the number of cases and a "n_max" to read_xlsx
to avoid error due to a dataset with additional info after the data
 '

# WRANGLE -----------------------------------------------------------------

# Set col names lowercase to uniform
colnames(SUS_data) <- str_to_lower(colnames(SUS_data))
str(SUS_data)

# Select var of interests:
# the 10 questions
# some additional sociovar (age, gender) 

# Prepare dataset
SUS_data <- SUS_data %>%
  select(starts_with(c("q", "age","gender"))) %>%
  mutate_if(is.character, as.factor) %>%
  mutate(id = c(1:nrow(SUS_data))) %>%
  select(id, everything())
glimpse(SUS_data)

# Check for missing data
no_missing_responses <- sum(is.na(SUS_data))
no_missing_responses
# Replace missing data for questions with central point
# Usually if users can't respond to an item, they should input the center value
SUS_data <- SUS_data %>%
  mutate_at(vars(starts_with("q")), replace_na, 3)
# This will leave unaltered NAs for other variables

# TO BE REVIEWD, SEE SHINY APP
# # Transform odd/even answers
# odd_col <- c("question1", "question3", "question5", "question7", "question9")
# even_col <- c("question2", "question4", "question6", "question8", "question10") 
# 
# SUS_data[, odd_col] <- SUS_data[, odd_col] - 1
# SUS_data[, even_col] <- 5 - SUS_data[, even_col]
# 
# # Compute the score
# SUS_data <- SUS_data %>%
#   # To calculate new variable by row and not by col:
#   rowwise() %>% # see https://dplyr.tidyverse.org/articles/rowwise.html
#   # Apply to all question (question1..question10)
#   mutate(score = sum(c_across(starts_with("q"))) * 2.5, .after=id)
#   # NB: A potential ISSUE might be that a dataset has a variable that
#   # starts with "q" but it is not a question (e.g. "quarter")
# SUS_data
# # NB: WRONGGGGG!! THE 2.5* MUST BE DONE ON THE TOTAL INDIVIDUAL SCORES, NOT ON SINGLE RESPONSES!


# PLOTS AND STATS ---------------------------------------------------------

# Demographics

SUS_data %>%
  ggplot(aes(x=age)) +
  geom_bar(aes(fill=age), show.legend = F) +
  labs(title="Age distribution",
        x="Age class", y="Frequency") +
  hrbrthemes::theme_ipsum_rc()

SUS_data %>%
  ggplot(aes(x=gender)) +
  geom_bar(aes(fill=gender), show.legend = F) +
  labs(title="Gender distribution",
       x="Age class", y="Frequency") +
  hrbrthemes::theme_ipsum_rc()

SUS_data %>%
  ggplot(aes(x=age, fill=gender)) +
  geom_bar() +
  labs(title="Gender distribution by age class",
       x="Age class", y="Frequency", fill="Gender") +
  hrbrthemes::theme_ipsum_rc()


# PLOT: Histogram of scores
SUS_data %>%
  ggplot(aes(x=score)) +
  geom_histogram(bins=10, aes(fill="tomato"), show.legend = F) +
  hrbrthemes::theme_ipsum_rc() +
  labs(title="Histogram of scores",
       x="Score",y="Frequency") +
  hrbrthemes::theme_ipsum_rc()

# Score stats
'Remember to add a simply explanation for this values (especially for the SD)'
summary(SUS_data$score)
score_mean <- summary(SUS_data$score)["Mean"]
score_min <- summary(SUS_data$score)["Min."]
score_max <- summary(SUS_data$score)["Max."]
score_median <- summary(SUS_data$score)["Median"]
score_sd <- sd(SUS_data$score)

# Percentile ranking
SUS_data$percent_rank <- percent_rank(SUS_data$score)
SUS_data <- SUS_data %>%
  dplyr::select(id, score, percent_rank, everything())
SUS_data

# Grade scores with letters
SUS_data <- SUS_data %>%
  mutate(grade = case_when(score >= 78.9 ~ "A",
                           between(score,72.6,78.8) ~ "B",
                           between(score,62.7,72.5) ~ "C",
                           between(score,51.7,62.6) ~ "D",
                           # This is not an error, "E" is not used (See "Quantifying user experience")
                           score <= 51.6 ~ "F"),
         .after = percent_rank)
SUS_data


# PLOT: Percentile ranking in percentage vs Score
qplot(data=SUS_data, x=score, y=percent_rank, geom="point") +
  scale_y_continuous(labels=scales::percent_format(accuracy=1)) +
  geom_hline(yintercept=0.50, linetype="dashed", color="grey60", size=1) +
  geom_vline(xintercept=68, linetype="dashed", color="grey60", size=1) +
  labs(title = "Percentile rank vs. SUS Scores",
       x="SUS Score", y="Percentile Rank") +
  hrbrthemes::theme_ipsum_rc() +
  scale_x_continuous(limits=c(0,100), breaks=seq(0,100,10)) +
  geom_rect(aes(xmin=78.9,xmax=100,ymin=0,ymax=1), fill="green", alpha=0.01) +
  geom_rect(aes(xmin=72.6,xmax=78.9,ymin=0,ymax=1), fill="greenyellow", alpha=0.01) +
  geom_rect(aes(xmin=62.7,xmax=72.6,ymin=0,ymax=1), fill="orange", alpha=0.01) +
  geom_rect(aes(xmin=51.6,xmax=62.7,ymin=0,ymax=1), fill="orangered3", alpha=0.01) +
  geom_rect(aes(xmin=0,xmax=51.6,ymin=0,ymax=1), fill="red3", alpha=0.01) +
  annotate("text", x=78.9+(100-78.9)/2, y=1, label="A") +
  annotate("text", x=72.6+(78.9-72.6)/2, y=1, label="B") +
  annotate("text", x=62.7+(72.6-62.7)/2, y=1, label="C") +
  annotate("text", x=51+(62.6-51)/2, y=1, label="D") +
  annotate("text", x=(51.6/2), y=1, label="F")
  

# Grade scores with adjective
#TOBEDONE

# Reliability (Cronbach's alpha)
# Psych::alpha() https://www.rdocumentation.org/packages/psych/versions/2.0.7/topics/alpha
SUS_questions <- SUS_data %>%
  dplyr::select((starts_with("q")))

SUS_reliability <- psych::alpha(x=SUS_questions)
# Extract Cronbach's Alpha
SUS_raw_alpha <- SUS_reliability$total$raw_alpha
round(SUS_raw_alpha, 2)
# SUS_std_alpha <- SUS_reliability$total$std.alpha

# SUB-SCALES
# See "Quantify the user experience", p.200
usable_questions <- c("question1", "question2", "question3",
                      "question5", "question6", "question7",
                      "question8", "question9")
learnable_questions <- c("question4", "question10")

SUS_data[, usable_questions]
SUS_data[, learnable_questions]

usable_scale_reliability <- psych::alpha(x=SUS_data[, usable_questions])$total$raw_alpha
usable_scale_reliability
learnable_scale_reliability <- psych::alpha(x=SUS_data[, learnable_questions])$total$raw_alpha
learnable_scale_reliability

# Compute the score for Usability
usability_score <- SUS_data[, usable_questions] %>%
  rowwise() %>% 
  mutate(individual_usability_score = sum(c_across(starts_with("q"))) * 2.5) %>% 
  ungroup() %>%
  summarise(usability_score = mean(individual_usability_score))
usability_score

learnable_score <- SUS_data[, learnable_questions] %>%
  rowwise() %>% 
  mutate(individual_learnable_score = sum(c_across(starts_with("q"))) * 2.5) %>% 
  ungroup() %>%
  summarise(learnable_score = mean(individual_learnable_score))
learnable_score

