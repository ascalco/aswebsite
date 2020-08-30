---
title: "HealthyU Pricing Plans"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
---

## Overview: HealthyU pricing plans

HealthyU is faux case study I developed thinking after my experience in working around health and nutrition. Many 

### The challenge: Increase registration to the community

The challenge is to increase the number of users\that choose to register and engage with HealthyU community without alter the number of types of services offered.

### The solution: Add a third option...to reduce uncertainty

The 

--- INSERT PLAN 2-OPT 
--- INSERT PLAN 3-OPT ---

### Results 

First, let's have a look at the preference for a 2-option pricing plan (see table and plot below). It seems that the preference is almost evenly distribute (Plan A: 40%; Plan B: 60%). To behind intution, we perform a z-test in R and assess if there is a significant difference from a random distribution (50/50). So we run: ```binom.test(x=c(12,8), p=0.5, conf.level = 0.95)```. If the resulting returned *p*-value is above 0.05 there is not a significant differentce between the proportions and we can effectively claim preferences are split half and half. The returned *p*-value is ```0.503```: users are equally split between the two plans.

Now, we observe the 3-option pricing plan. It is clear that now the majority of users (more than 60%) prefer to the third option. This might seem contradictory given the Plan C in the 3-option plan is equal to Plan B from the 2-option plan. This is the result of adding an option in the middle which is better than the left option, but worser than the right option. However, let's assess the if there a true statistical difference between the options of the novel plan.  

<center>

| **Pricing plan** | **Plan** | **No. of users** | **Percentage** |
|---|---|---|---|
| 2 options | Plan A | 8 | 40% |
| 2 options | Plan B | 12 | 60% |
| 3 options | Plan A | 3 | 15% |
| 3 options | Plan B | 4 | 20% |
| 3 options | Plan C | 13 | 65% |

</center>


<img src="/projects/case_study_pricing_plans_files/Percentage_preference_plans_1000x600.png" alt="Preference for pricing plans" width="700px" height="450px"/>

Since we are interested in seeing if the preference moved to the £5 plan, we can collapse plan B and C into one option. The resulting table of preference is the folling.


| **Pricing plan** | **Price of plan** | **No. of users** | **Percentage** |
|---|---|---|---|
| 2 options | £3 | 8 | 40% |
| 2 options | £5 | 12 | 60% |
| 3 options | £3 | 3 | 15% |
| 3 options | £5 | 17 | 85% |


We can again use the z-test to assess the statistical difference between the proportions of the 3-option pricing plans running in R ```binom.test(x=c(17,3), p=0.5, conf.level = 0.95)```. The returned *p*-value is ```0.003```, below the threshold of 0.05. Therefore, there 3-option plan which used a third option as a decoy actually moved users preferences towards the £5 plans. We can also estimate the 95% confidence intervals and plot them to visually inspect the differences.

<img src="/projects/case_study_pricing_plans_files/Percentage_preference_prices_1000x600+CIs.png" alt="Preference based on available prices" width="700px" height="450px"/>


### Reflections


##### Footnotes

[1] ABC