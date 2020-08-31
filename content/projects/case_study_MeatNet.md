---
title: "Artificial simulations interfaces"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
type: projects
---

Artificial simulations (formally, agent-based models) are a powerful technique used by scientists to model technical and social systems and investigate the likely effects of interventions on those systems. Modelling software such as [NetLogo](https://ccl.northwestern.edu/netlogo/) enable computer and social scientists to program and develop new models. More than a dozen inputs and outputs are usually present in the interface. In addition, these simulations display on an interface screen how systems develop in real-time. Artificial simulations are highly program-centered. This project developed an interface that could make the simulation intuitive to the point of being self-explanatory to audiences unfamiliar with the methodology. 

### The challenge: make an unfriendly interface friendly

This research project sought to investigate issues in simulations interfaces through the refinement of the interface of a specific artificial simulation called MeatNet [1]. Below you can see the first version of the simulation interface as programmed by the developer.

<img src="/projects/case_study_MeatNet_files/MeatNet_interface-1.png" alt="The simulation interface at the start of the research" width="750" height="325px"/>

### The solution: improve-iterate-improve

A series of usability tests were designed and conducted. In particular, the research was dived into three main phases.

#### (1) A cognitive walkthrough of the interface

A cognitive walkthrough is a usability evaluation method in which a trained evaluator takes on the role of an inexperienced user and asks a set of questions and works through a series of tasks from their perspective. At the end of the walkthrough, several recommendations were handled to the developer about how to improve the interface to maximise usability and learnability by potential users.

General recommendations were made especially in relation to convention, consistency and clarity. For example:

+ Use full words to label the simulation inputs where possible. NetLogo does not allow spaces between words on slider labels, but where necessary words should be linked via hyphens rather than dots i.e. ‘meat-price’ rather than ‘meat.price’.
+ Keep labelling consistent within the interface. For example, always use ‘#’ rather than mixing with the abbreviation ‘num.’
+ Make better use of the modelling software note function, which enables instructions and details to be provided above buttons and slider to maximise clarity to the user.

In addition to these general recommendations, some additional suggestions to specific sections of the interface were provided. For instance:

+	‘Define and create networks’ (at the left-hand side of the interface). For this model, this section of the interface is for the developer only, and its functionality is not of interest or importance to participants. It was subsequently hidden.

+	Graphical window. The workplace area represented by the factory was not big enough to contain all the agents that ‘go to work’, which was confusing. The screen speed slider on the graphical window was not intuitive as the speed increased as the slider was moved to the left rather than to the right. In addition to correcting these issues, a legend was added for clarity.

+	Plots. All axes on the charts should be labelled for clarity of understanding. Redundant labelling and plots were removed for the subsequent version of and the position of the remaining plots was reordered.

Following these recommendations, the interface for MeatNet was modified to the version shown in the following figure.

<img src="/projects/case_study_MeatNet_files/MeatNet_interface-2.jpg" alt="The simulation interface after the first phase" width="750px" height="325px"/>

#### (2) Refine and iterate

Following the changes made after the previous phase, a series of usability evaluations were conducted. These exercises were undertaken by non-expert participants using the think-aloud protocol, which involves asking participants to voice their thoughts as they work through a series of pre-defined tasks. Their interactions with the interface were voice and video-recorded for analysis purposes. Next to the participant set the researcher to prompt and assist if necessary. A usability evaluation undertaken in this fashion tends to require 3-5 participants to identify the key problematic issues and difficulties with an interface, at which point changes are made, and then the process begins again with the new version of the interface and a different set of participants. Iterative usability evaluations are very effective at identifying and correcting interface usability problems. The experimental set-up is shown below.

<img src="/projects/case_study_MeatNet_files/MeatNet_interface-Exp_setup.png" alt="Experimental set-up for usability evaluations" width="500px" height="350px"/>

Participants were recruited in line with our final audience (scientists unfamiliar with artificial simulations). Before starting the study participants received an information sheet about artificial simulations. For this phase, participants sought 2 different simulations and then MeatNet. The first simulation was used to show to participants a working simulation. The second gave participants the chance to engage with a simulation. Finally, the third was the target simulation. Participants were here asked to autonomously complete 4 tasks and voice their thought processes. The study lasts about 30 minutes per participant.

The first usability assessment involved 3 participants. We observed where participants' attention was directed and what was ignored. Tasks were performed with little prompts by the researcher. Several recommendations to the developer were made.

A second usability assessment was conducted with 3 participants. Changes made following the previous iteration successfully improved the intuitiveness of the simulation interface (e.g. the graphical window was reduced so that participants' attention was focused on plots).

Four participants took part in a third iteration. This time participants encountered fewer issues when completing the tasks. It was agreed with the team that we had reached a point where the interface was reasonably intuitive to understand and use considering the limitations of the software.

#### (3) Test the intuitiviness of the interface remotely

An online survey incorporating videos of the finalised simulation interface was designed and administered. Again, participants were recruited among scientists unfamiliar with artificial simulations (a screener was added at the beginning of the survey). 11 participants took part. The survey included 3 narrated videos while tasks were performed. Participants could watch the videos as many times as wished, then they were asked to respond to a set of questions aimed at evaluating the intuitiveness of the simulation. 

### Results: less frightful simulations

Finally, an analysis of the answers was conducted. Overall, the work done on the model drastically improved the intuitiveness of the simulation. Not only did the majority of respondents answer the questions correctly, they were able to give explanations for their answers, indicating that they understood how the model was behaving, and providing possible reasons for unexpected results.

##### Footnotes

[1]: A [scientific paper](http://jasss.soc.surrey.ac.uk/22/4/8.html) about MeatNet aimed at an audience familiar with the artificial simulations has been recently published in the Journal of Artificial Societies and Social Simulation.