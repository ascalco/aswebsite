---
title: "Artificial simulations interfaces"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
type: projects
---

### Overview

Artificial simulations (formally, agent-based models) are a powerful technique with which to model complex systems and to investigate the likely effects of interventions on those systems. Modelling environments such as [NetLogo](https://ccl.northwestern.edu/netlogo/) enable computer and social scientists to program and develop new models, and display these models how the simulation develops in real-time on an interface screen. Artificial simulations are highly program-centric, however we wanted to be sure that such simulations were intuitive to understand at least to technical audiences.

### The challenge

This research project sought to investigate these issues through the refinement of the NetLogo interface for a specifici artificual simulation called MeatNet [1]. You can see the first version of the simulationn interface as programmed by the developer.

<img src="/projects/case_study_MeatNet_files/MeatNet_interface-1.png" alt="The simulation interface at the start of the research" width="1000px" height="600px"/>

### The solution

A series of of usability tests were designed and conducted. In particular the research was dived into three main phases.

#### (1) Cognitive walkthroughs of the interface

I conducted a cognitive walkthrough of the  simulation interface. A cognitive walkthrough is a usability evaluation method in which a trained evaluator takes on the role of an inexperienced user and asks a set of questions and works through a series of tasks from their perspective. At the end of the walkthrough I provided a series of recommendations to the interface designer as to how to improve the interface to maximise usability and learnability by potential users.


General recommendations were made especially in relation to convention, consistency and clarity. For example:

+ Use full words to label the simulation inputs where possible. NetLogo does not allow spaces between words on slider labels, but where necessary words should be linked via hyphens rather than dots i.e. ‘meat-price’ rather than ‘meat.price’.
+ Keep labelling consistent within the interface. For example, always use ‘#’ rather than mixing with the abbreviation ‘num.’
+ Make better use of the modelling software note function, which enables instructions and details to be provided above buttons and slider to maximise clarity to the user.

In addition to these general reccomendations, some additional suggestions to specific sections of the interface were porived. For instance:

+	‘Define and create networks’ (left hand side of interface). For this model, this section of the interface is for the developer only, and its functionality is not of interest or importance to participants. It was subsequently hidden.

+	Graphical window. The workplace area represented by the factory was not big enough to contain all the agents that ‘go to work’, which was confusing. The screen speed slider on the graphical window was not intuitive as the speed increased as the slider was moved to the left rather than to the right. In addition to correcting these issues a legend was added for clarity.

+	Plots. All axes on the charts should be labelled for clarity of understanding. Redundant labelling and plots were removed for subsequent version of and the position of the remaining plots was reordered.

Following these recommendations, the interface for MeatNet was modified to the version shown in the following figure.

<img src="/projects/case_study_MeatNet_files/MeatNet_interface-2.jpg" alt="The simulation interface after the first phase" width="1000px" height="600px"/>

#### (2) Refine and iterate

Following the walkthrough and the changes made on the basis of the recommendations, a series of usability evaluations of the simulation interface were undertaken. These exercises were undertaken by non-expert participants using the think aloud protocol, which involves asking participants to voice their thoughts as they work through a series of pre-defined tasks. Their interactions with the interface are voice and video-recorded for analysis purposes. A researcher sits beside the participant to prompt and assist if necessary.

<img src="/projects/case_study_MeatNet_files/MeatNet_interface-Exp_setup.png" alt="Experimental set-up for usability evaluations" width="700px" height="450px"/>

#### (3) Test the intuitiviness of the interface remotely

An online survey incorporating videos of the finalised simulation interface 

### Results 


### Reflections



##### Footnotes

[1] A [scientific paper](http://jasss.soc.surrey.ac.uk/22/4/8.html) about MeatNet aimed to an audience familiar with the artificial simulations has been recenlty published in the Journal of Artificial Societies and Social Simulation.