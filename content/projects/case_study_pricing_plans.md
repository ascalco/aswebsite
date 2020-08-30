---
title: "HealthyU Pricing Plans"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
type: project
---

### Overview: HealthyU pricing plans

Being part of a community of people that share the same values and principles can drastically increase the chances of successfully change individual habits. HealthyU is faux case study I developed after my experience in the health and nutrition sectory. I challenged myself to increase customers subscriptions to an online community with the minimum edits to the original plan. To this purpose, I leveraged one of my favourite cognitive phenomenon: the attraction effect. Statistical results showed that customers preferring the higher subscription plan, where customers engage with the online community, increased from 60% to 85%.

### The challenge: Increase the registration to the community

The challenge is to increase the number of users that choose to register and engage with HealthyU community without altering the number or types of services offered by HealthyU.

### The solution: Add a third option...to reduce uncertainty

It may seems a paradox, but in some cases adding a third choice can reduce the uncertainty. This for instance happend in the case of the attraction effect (or, decoy effect).

### The process

First, I created the materials for the research using Figma. Below I reported HealthyU original 2-option pricing plan. The two options are said to evenly split customers between the two plans [2]. 

<img src="/projects/case_study_pricing_plans_files/Plans-2_Options-Updated.png" alt="2-option plan" width="700px" height="450px"/>

Without altering the services offered by HealthyU, I created a third option that will act as a decoy. The figure below showed the renewed pricing plan with three option. You can see that Plan C is actually equal to the original Plan B. Instead, Plan B is now decoy option. Being worse than C it should move users' preferences towards the desired plan, which fully engage customers with the community and a healthy living style. 

<img src="/projects/case_study_pricing_plans_files/Plans-3_Options_with_decoy.png" alt="3-option plan" width="700px" height="450px"/>

The attraction effect has been demonstrated in a number of study and it seems quite robust. So, a small sample of participants should be enough to obtain meaningful results. To make things more interesting, I kept the budget low. So, website that offers research services are banned. Instead, I relied on Qualtrics free plan and Amazon Mechanical Turk (henceforth, MTurk). Long story short, I connected the two services keeping safe the anonymity of the respondents by creating a random shared ID. I then recruited 20 participants for each condition (the original 2-option plan vs. the 3-option plan, collected the responses, and analysed the data. Overall, the total expanses for the study was about £5 (£0.10 per respondent, plus MTurk service fee).

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

<center>

| **Pricing plan** | **Price of plan** | **No. of users** | **Percentage** |
|---|---|---|---|
| 2 options | £3 | 8 | 40% |
| 2 options | £5 | 12 | 60% |
| 3 options | £3 | 3 | 15% |
| 3 options | £5 | 17 | 85% |

</center>

We can again use the z-test to assess the statistical difference between the proportions of the 3-option pricing plans running in R ```binom.test(x=c(17,3), p=0.5, conf.level = 0.95)```. The returned *p*-value is ```0.003```, below the threshold of 0.05. Therefore, there 3-option plan which used a third option as a decoy actually moved users preferences towards the £5 plans. We can also estimate the 95% confidence intervals and plot them to visually inspect the differences.

<img src="/projects/case_study_pricing_plans_files/Percentage_preference_prices_1000x600+CIs_b.png" alt="Preference based on available prices" width="700px" height="450px"/>


### Reflections

MTurk has been a breakthrough for the recruitment of participants in case of tight budgets. On the other side, Qualtrics only allows for 8 questions. It would be good to evaluate alternative services and their free plans (e.g. Lime Survey).

Although the results are promising, they only measured customers' intention to subscribe to plans ("Read the plans available and their cost. Which one would you prefer?""). Future research should be conducted to evaluate users' behaviours.

##### Footnotes

[1] The "original" plan was tested few times to get the right balance between Plan A and B.