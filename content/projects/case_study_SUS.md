---
title: "SUS.io"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
type: page
---

### Overview: Measure usability with scientific rigour

The System Usability Scale (SUS) is a quick and useful tool for measuring the usability of a variety of products (including websites and apps). Immediately after the interaction with the products, users responds to a 10-item questionnaire with five response options (from "Stronlgy agree" to "Strongly disagree"). It is so popular that it accounts for more than 40% of post-test questionnaire usage (Sauro & Lewis, 2009).

Although some spredsheet templates are available for the score of the SUS, an automated programme for data reporting is today missing. Given it is often use, automate the analysis could save much time. 

In this work, I designed and developed a data reporting programme for the SUS thinking, mainly to easy my work. A working prototype is available here: [working prototype is available](https://ascalco.shinyapps.io/SUS-Data-Reporting/?_ga=2.231126495.1390696468.1598727132-674067509.1598615054). Try it with a [sample file](projects/case_study_SUS_files/Template-SUS_analysis_questions.xlsx) or upload your data [2].
 

### The challenge: Automate now, save time later

I challenged myself to design and then produce a functional and intuitive data reporting programme. I envisaged two main sub-challenges:

1 - A questionnaire can produce a lot of information: what are the most relevant when it comes to the SUS? It becomes crucial to identify the primary information to be presented to users, and what can be said to be secondary. Here, desk research can be useful.

2- The programme should present the information in a clear manner to ease results interpretation. Although I originally thought it for myself, I quickly moved to a larger audience: UX Designer and Researchers that frequently make use of the SUS, but that might not have strong confidence in data analysis. In this case, I will try to apply design principles being conscious of my skills with HTML and CSS.

### The process: Divide and conquer

I divided the work process into 4 tasks.

1 - **Evaluate metrics.** After reviewing several publication about the SUS, it seems that besides computing the individual and overall scores, other psychometric metrics are important (for instance, the reliabiliaty of the questionnare and the subscales). In this phase I reviewed and listed the metrics associated with the SUS. Then, I ordered them by importance to create an architecture of information. Also,I decided to focus on outputs and limited the inputs to one (i.e. the file containting the SUS raw scores from users). The primary information pertain to the overall scores, while secondary information pertain to individual scores.

<!--
<img style="padding: 15px; margin: 0px; float: left;" src="/projects/case_study_SUS_files/SUS-Information-List.png" alt="List of information to display" width="350px" height="500px"/>
-->

<img src="/projects/case_study_SUS_files/SUS-Information-Hierarchy.png" alt="Hierarchy of information" width="1000px" height="350px"/>

2 - **Hands-on programming**. I downloaded a case study about the SUS[2] and performed the analysis in R for the metrics identified in the first step. The final (rough) script can be downloaded here: [SUS-Script_R-v2.1](projects/case_study_SUS_files/SUS Shiny Analyser-v.1.0.R).

3 - **Design a neat interface**. Here the work done in phase 1 came to a value again. I split the information to be presented in two tabs and presented them considering their relevance. I iterated through different designs until I came to a satisfactory result. I need also to consider my skill level with the developement of custom templates for Shiny, the software I chose to use to bring together data analysis and user interface. 

<img src="/projects/case_study_SUS_files/SUS-Desktop_gif.gif" alt="Low fidelity prototype" width="600px" height="338px"/>

4 - **The dirty work**. Using Shiny I programmed the interface, then re-coded and automate the analysis performed in phase 2.

### Results 

A [working prototype is available](https://ascalco.shinyapps.io/SUS-Data-Reporting/?_ga=2.231126495.1390696468.1598727132-674067509.1598615054). You can download a [sample file](projects/case_study_SUS_files/Template-SUS_analysis_questions.xlsx) and upload it into the online programme to see the magic! [1] You can also upload your data [2].

The first tab present the primary information a user may want from the SUS.
The most important information (the scores for the overall questionnaire and its subscales) are presented immediatily to users. Also, information about the scores and the associated reliability are grouped together by color (purple, green, orange), hierarchically organised (left: score, right: scale reliability), and 
order of information is consistent within groups. However, I was not able to  spatially group them as shown the design, providing some spaces between each couple of information .

The second most important piece of information is the chart of the scores, where the user can observe the score of each individual and compare it with the general SUS score (68). A color system is also presented and associated with Sauro and Lewis's grading system (A/B/C/D/F; 2016) to ease the interpration of the scores.

<img src="/projects/case_study_SUS_files/SUS_Analyser-Screenshot_1.png" alt="Primary information page" width="941px" height="471px"/>

The second tab presents secondary information relative to the individual scores. First it reports the number of cases in the questionnaire and missing questions. Although the users might already know these information, it is good to report them so that they can check if the programme correctly read the dataset uploaded. Then additional information about the minimum and maximum users scores are provided. This should give users an intuitive information about the range of scores. In addition, an histogram that shows the frequency of scores is provided, so that users can understand where the majority of users fall. Finally, a table with the original data is reported along with the individual score and the relative percentile rank and grade.

<img src="/projects/case_study_SUS_files/SUS_Analyser-Screenshot_2_c.png" alt="Secondary information page" width="941px" height="471px"/>

### Reflections

- Results are presented, but I realised while using it that some more information could ease the interpretation process. Some of the audience might not be familiar with psychometrics measures and their interpretation. Additional text providing an interpretation to the results (for instance, "Reliability is considered acceptable for values over .70") could improve the usability of the programme.

- The next step is the evaluation of the products by the users. The development of a survey to administer to a sample of UX Designer and Researcher is under development (Aug 2020). The developments of personas is suggested. Ironically, the SUS could be used to evalute the usability of the product itself.


##### Footnotes

[1] If magic doesn't spark, please contact me at as.uxr@yahoo.com. 

[2] Your data will be temporarily stored and then deleted when exiting the programme. Since it is still a prototype it does not have much flexibility. Files containing the SUS data must be Excel files (xlsx) formatted in the following way:
  - each row rapresents a case (i.e. a user);
  - each column is a variable;
  - questions must be named question1, question2, ..., question10;
  - the first row of the excel file must contain the names of the columns.
See the [sample file](projects/case_study_SUS_files/Template-SUS_analysis_questions.xlsx)

[3] For this I chose the [freely available dataset by I. Khan](https://data.mendeley.com/datasets/wvt649xnvw/1)