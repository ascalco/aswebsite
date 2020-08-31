---
title: "SUS.io"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
type: projects
---

The System Usability Scale (SUS) is a quick and useful tool for measuring the usability of a variety of products (including websites and apps). Immediately after the interaction with the products, users respond to a 10-item questionnaire with five response options (from "Strongly agree" to "Strongly disagree"). It is so popular that it accounts for more than 40% of post-test questionnaire usage (Sauro & Lewis, 2009).

Although some spreadsheet templates are available for the score of the SUS, an automated programme for data reporting is today missing. Given it is often used, automate the analysis could save much time. 

In this work, I designed and developed a data reporting programme for SUS with the main aim to easy my work. A [working prototype is available](https://ascalco.shinyapps.io/SUS-Data-Reporting/?_ga=2.231126495.1390696468.1598727132-674067509.1598615054) online. Try it with a [sample file](projects/case_study_SUS_files/Template-SUS_analysis_questions.xlsx) or upload your data [1].
 

### The challenge: Automate now, save time later

I challenged myself to design and then produce a functional and intuitive data reporting programme. I envisaged two main sub-challenges:

1 - What information could be considered relevante for the SUS?

2- How do I convey the information in a clearn and intuitive manner? In this case, I tried applying design principles being conscious of my skills with HTML and CSS.

### The process: Divide and conquer

I divided the work process into 4 tasks.

1 - **Evaluate metrics.** After reviewing several publication about the SUS, it seems that besides computing the individual and overall scores, other psychometric metrics are important (for instance, the reliabiliaty of the questionnare and the subscales). In this phase I reviewed and listed the metrics associated with the SUS. Then, I ordered them by importance to create a hierarchical structure of information. Also,I decided to focus on outputs and limited the inputs to one (i.e. the file containting the SUS raw scores from users). The primary information pertain to the overall scores, while secondary information pertain to individual scores.

<!--
<img style="padding: 15px; margin: 0px; float: left;" src="/projects/case_study_SUS_files/SUS-Information-List.png" alt="List of information to display" width="350px" height="500px"/>
-->

<img src="/projects/case_study_SUS_files/SUS-Information-Hierarchy.png" alt="Hierarchy of information" width="1000px" height="350px"/>

2 - **Hands-on programming**. I downloaded a case study about the SUS[3] and performed the analysis in R for the metrics identified in the first step. The final (rough) script can be downloaded here: [SUS-Script_R-v2.1](projects/case_study_SUS_files/SUS Shiny Analyser-v.1.0.R).

3 - **Design a neat interface**. Here the work done in phase 1 came to value again. I split the information to be presented in two tabs and presented them considering their relevance. I iterated through different designs until I came to a satisfactory result. I need also to consider my skill level with the development of custom templates for Shiny, the software I chose to use to bring together data analysis and user interface. 

<img src="/projects/case_study_SUS_files/SUS-Desktop_gif.gif" alt="Low fidelity prototype" width="600px" height="338px"/>

4 - **The dirty work**. Using Shiny I programmed the interface, then re-coded and automate the analysis performed in phase 2.

### Results 

A [working prototype is available](https://ascalco.shinyapps.io/SUS-Data-Reporting/?_ga=2.231126495.1390696468.1598727132-674067509.1598615054). You can download a [sample file](projects/case_study_SUS_files/Template-SUS_analysis_questions.xlsx) and upload it into the online programme to see the magic! [2] You can also upload your data [1].

The first tab presents the primary information a user may want from the SUS. The most important information (the scores for the overall questionnaire and its subscales) are presented immediately. Also, information about the scores and the associated reliability are grouped together by colour (purple, green, orange), hierarchically organised (left: score, right: scale reliability), and order of information is consistent within groups. However, I was not able to spatially group them as shown the design, providing some spaces between each couple of information.

The second most important piece of information is the chart of the scores, where the user can observe the score of each individual and compare it with the general SUS score (68). A colour system is also presented and associated with Sauro and Lewis's grading system (A/B/C/D/F; 2016) to ease the interpretation of the scores.

<img src="/projects/case_study_SUS_files/SUS_Analyser-Screenshot_1-Actual_prototype.png" alt="Primary information page" width="941px" height="471px"/>

The second tab presents secondary information relative to the individual scores. First, it reports the number of cases in the questionnaire and missing questions. Although the users might already know this information, it is good to report them so that they can check if the programme correctly read the dataset uploaded. Then additional information about the minimum and maximum users scores are provided. This should give users a piece of intuitive information about the range of scores. In addition, a histogram that shows the frequency of scores is provided so that users can understand where the majority of users fall. Finally, a table with the original data is reported along with the individual score and the relative percentile rank and grade.

<img src="/projects/case_study_SUS_files/SUS_Analyser-Screenshot_2-Actual_prototype.png" alt="Secondary information page" width="941px" height="471px"/>

### Reflections

- Results are presented, but I realised while using it that some more information could ease the interpretation process. Some of the audience might not be familiar with psychometric measures and their interpretation. Additional text providing an interpretation to the results (for instance, "*Reliability is generally considered acceptable for values over .70*") could improve the usability of the programme.

- The next step is the evaluation of the products by the potential users besides me. It would be good to develop a survey to administer to a sample of UX Designers and Researchers and create personas. Ironically, the SUS could be used to evaluate the usability of the programme itself.

##### Footnotes

[1]: Your data will be temporarily stored and then deleted when exiting the programme. Since it is still a prototype it does not have much flexibility. Files containing the SUS data must be Excel files (xlsx) formatted in the following way:

+ each row represents a case (i.e. a user);
+ each column is a variable;
+ questions must be named question1, question2, ..., question10;
+ the first row of the excel file must contain the names of the columns.

See for instance the [sample file](projects/case_study_SUS_files/Template-SUS_analysis_questions.xlsx)

[2]: If magic doesn't spark, please contact me at scalco.andrea@outlook.com. 

[3]: For this I chose the [freely available dataset by I. Khan](https://data.mendeley.com/datasets/wvt649xnvw/1)