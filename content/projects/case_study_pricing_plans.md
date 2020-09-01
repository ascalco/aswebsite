---
title: "HealthyU pricing plans"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
type: projects
---

Being part of a community of people who share the same values and principles can drastically increase the chances of successfully change individual habits [1]. HealthyU is a faux case study I developed after my experience in the health and nutrition sector. I challenged myself to **increase customers subscriptions to an online community** with the minimum edits to the original plan. To this purpose, I leveraged one of my favourite Behavioral Economics phenomena: the decoy effect. Statistical analyis showed that customers preferring the higher subscription plan (where customers actively engage with the community), increased **from 60% to 85%**.

### The challenge: Increase the registration to the community

The challenge is to increase the number of users that choose to register and engage with HealthyU online community, but **without altering the number or types of services offered**. 

In addition, since it is a personal challenge, I want to work with a **tight budget**.

### The solution: Add a third option...to reduce uncertainty

It may seem a paradox, but in some cases adding a third choice can reduce the uncertainty. This, for instance, happens in the case of the decoy effect: when consumers are faced with two options perceived equally valuable, they will tend to prefer one of the two options when a third one (called *decoy*) is added. However, there are rules about the introduction of a third option. Above all the decoy must be "asymmetrically dominated" by the option we want consumers to prefer. In other words, the third option should be similar but slighthly worse at least in one attribute than the option we want to highlight. Without diving into the details, Ariely beautifully explains this effect during [a recorded lesson on YouTube](https://www.youtube.com/watch?v=xOhb4LwAaJk) using as an example The Economists' subscription plans.

First things first, I ran an **comparative research** about pricing plans webpages, scouting different platforms (e.g. Booksy, Dunked, Klets). Then I designed a likely pricing plans webpage for HealthyU using a Figma free account. Below I reported the 2-option pricing plan where customers tend to split evenly between the two plans [1]: we want to increase subscriptions for the $5 plan withouth altering the number or types of service offered.

<img src="/projects/case_study_pricing_plans_files/Plans-2_Options-Updated.png" alt="2-option plan" width="700px" height="450px"/>

After thinking a while about the correct way to split the services, **a third option (the decoy) was created**. The figure below shows the renewed pricing plan with three options. You can see that Plan C is actually equal to the original Plan B. Instead, Plan B is the decoy option. Being worse than C it should move users' preferences towards the desired plan, which fully engage customers with the community and a healthy living style. 

<img src="/projects/case_study_pricing_plans_files/Plans-3_Options_with_decoy.png" alt="3-option plan" width="700px" height="450px"/>

The decoy effect has been demonstrated in a number of studies and it seems quite robust. So, a small sample of participants should be enough to obtain meaningful results. To make things more interesting, I kept the budget low. So, websites that offer full-fledged research services are banned. Instead, I relied on **Qualtrics free plan** and **Amazon Mechanical Turk** (henceforth, MTurk). Long story short, I connected the two services keeping safe the anonymity of the respondents by creating a random shared ID. I then **recruited 20 participants** for each condition (the original 2-option plan vs. the 3-option plan, collected the responses and analysed the data. Overall, the **total expenses for the study were about £5** (£0.10 per respondent, plus MTurk service fee).

### Results: a larger community

First, let's have a look at the preference for the 2-option pricing plan (see table and plot below). It seems that the preference is almost evenly distributed (Plan A: 40%; Plan B: 60%). To move behind intuition, we perform a z-test in R and assess if there is a significant difference from a random distribution (50:50). So we run: ```binom.test(x=c(12,8), p=0.5, conf.level = 0.95)```. If the resulting *p*-value is above 0.05 there is not a significant difference between the proportions and we can effectively claim preferences are split half and half. The returned *p*-value is ```0.503```: **users are equally split between the two plans**.

Now, we observe the 3-option pricing plan. It is clear that now the majority of users (more than 60%) prefer the third option. This might seem contradictory given the Plan C in the 3-option plan is equal to Plan B from the 2-option plan, but it is the result of adding an option in the middle which is better than the left option, but worse than the right option. Now, let's assess if there is a true statistical difference between the options of the renovated pricing plan.  

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

Since we are interested in seeing if the preference moved to the £5 plan, we can collapse plan B and C into one option. The resulting table of preference is the following.

<center>

| **Pricing plan** | **Price of plan** | **No. of users** | **Percentage** |
|---|---|---|---|
| 2 options | £3 | 8 | 40% |
| 2 options | £5 | 12 | 60% |
| 3 options | £3 | 3 | 15% |
| 3 options | £5 | 17 | 85% |

</center>

Again, we can use the z-test to assess the statistical difference between the proportions of the 3-option pricing plans running in R ```binom.test(x=c(17,3), p=0.5, conf.level = 0.95)```. The returned *p*-value is ```0.003```, below the threshold of 0.05. Therefore, **the 3-option plan which used the middle option as a decoy actually moved users preferences towards the £5 plans**. We can also estimate the 95% confidence intervals and plot them to visually inspect the differences.

<img src="/projects/case_study_pricing_plans_files/Percentage_preference_prices_1000x600+CIs_b.png" alt="Preference based on available prices" width="700px" height="450px"/>

Finally, if we look at the total revenues, we see that for 20 users the application of the decoy effect led to an increase of about 11% (from £84 of the original 2-option plan to £94 of the 3-option plan). The average money spent by costumer also increased from £4.2/user to $4.7/user.

### Reflections

MTurk has been a breakthrough for the recruitment of participants in case of tight budgets. On the other side, Qualtrics only allows for 8 questions: this was good enought for this case, but it would be good to evaluate alternative services and their free plans (e.g. Lime Survey).

Although the described work might look straightforward, it required several attempts to create a likely pricing plan webpage, find the right price balance for the 2-option plan, and find the "right spot" for the the decoy option.

Finally, although the results are promising, they only measured customers' intention to subscribe to plans ("*Read the plans available and their cost. Which one would you prefer?*"). Future research should be conducted to evaluate users' behaviours.

##### Footnotes

[1] Wang, Brede, Ianni, & Mentzakis (2018). [Social interactions in online eating disorder communities: A network perspective](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6066201/). PloS one, 13(7), e0200800.


[2]: The "original" plan was tested a few times to get the right balance between Plan A and B.