---
title: "Increase subscription rates using the decoy effect"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
type: research-bites
---

Being part of a community of people who share the same values and principles can drastically increase the chances of successfully change individual habits [1]. Here I want to show how adding a restructuring a pricing plan can **increase customers subscriptions to an online health community** without altering the services offered. To this purpose, I leveraged one of my favourite Behavioral Economics phenomena: the decoy effect. Statistical analysis showed that customers preferring to actively be involved with the community increased **from 60% to 85%**.

### The bit about psychology

The emergence of SaaS brought to consumers a wider range of purchase options. Monthly or yearly? What services? For you or your team? Psychology showed that too many options may lead to unwanted consequences such as impairing choice and decreasing motivation. This cognitive phenomenon is known as “Choice overload” [2]. However, if alternatives are carefully selected, the addition of options can produce the opposite effect, guiding the choice towards a predefined alternative. This, for instance, happens in the case of the “decoy effect”: when consumers are faced with two options perceived equally valuable, they will tend to prefer one of the two options when a third one (called *decoy*) is added.
The third option should be carefully selected considering some rules about perception. Above all the decoy must be "asymmetrically dominated" by the option we want consumers to prefer. This means that the third option should be similar but slightly worse at least in one attribute than the option we want to highlight. Without diving into the details, Ariely beautifully explains this effect during [a recorded lesson on YouTube](https://www.youtube.com/watch?v=xOhb4LwAaJk) using as an example The Economists' subscription plans.
Here I am going to do something like what explained by Ariely. First, I will create a pricing plan with two equally valuable options. Then, I will revise the services offered to create a third option (the decoy). The addition of the alternative will move users’ preference towards one of the two original alternatives.

### The starting point

First things first, I ran an **comparative research** about pricing plans webpages, scouting different platforms (e.g. Booksy, Dunked, Klets). Following their example, I designed a likely pricing plans webpage for a fake health community I named HealthyU. For this, I used Figma free account. Below I reported the 2-option pricing plan where customers tend to split evenly between the two plans [1].

<img src="/projects/case_study_pricing_plans_files/Plans-2_Options-Updated.png" alt="2-option plan" width="700px" height="450px"/>

From the image you can see I am promoting two different services: the first provides the subscription to a monthly newsletter, whereas the second add the access to the community. I want to increase subscriptions to the community plan without altering the number or types of service offered. Although pretty basic, this serve as a starting point to show how the decoy effect can be used.

### Add a third option...to reduce uncertainty

The figure below shows the renewed pricing plan with the added alternative between the originals. Plan A is unaltered. The original Plan B remains at the right side but has been renamed Plan C. Plan B is the decoy option: being better than Plan A but slightly worse than Plan C I expect it will move user preference towards the healthier plan, which subscribe users to the community.

<img src="/projects/case_study_pricing_plans_files/Plans-3_Options_with_decoy.png" alt="3-option plan" width="700px" height="450px"/>

### Plan and recruit

The decoy effect has been demonstrated in a number of studies and it has been deemed robust. Therefore, a small sample of participants should be enough to obtain meaningful results. To make things more interesting, let’s keep the budget low. So, websites that offer full-fledged research services are banned. Instead, I relied on **Qualtrics free plan** and **Amazon Mechanical Turk** (henceforth, MTurk). Long story short, I connected the two services by creating a random shared ID that helped me tracked respondents –keeping safe their anonymity. I then **recruited 20 participants** for each condition (the original 2-option plan vs. the 3-option plan). Overall, I got the responses after 12 hours (6 + 6, since Qualtrics allows only 1 active survey). I paid the participants and downloaded the responses. Overall, the total expenses for the study were about £5 (£0.10 per respondent, plus MTurk service fee).

### Results: a larger community

First, let's have a look at the preference for the 2-option pricing plan (see table and plot below). It seems that the preference is almost evenly distributed (Plan A: 40%; Plan B: 60%). To move behind intuition, we perform a z-test to assess if there is a significant difference from a random distribution (50:50). So, we type in R [4]: ```binom.test(x=c(12,8), p=0.5, conf.level = 0.95)```. If the resulting *p*-value is above 0.05 there is not a significant difference between the proportions, and we can effectively claim preferences are split half and half. The returned *p*-value is ```0.503```: **users are equally split between the two plans**.

Now, let’s see how the 3-option pricing plan performed. I reported the results in the table and plot below. Looking at the bar plot, the majority of users (more than 60%) prefer Plan C (again, equal to Plan B in the 2-option plan). This might seem contradictory given that Plan C is equivalent to Plan B from the 2-option plan: this shift of preference is the result of adding an option in the middle that is better than than one option, but slight worse than the other one. Next, I will assess if there is a true statistical difference between the options of the renovated pricing plan.  

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

Since we are interested in seeing if the preference moved from the newsletter subscription to the intention to involve with the health community, we can collapse plan B and C into one option. The resulting table of preference is the following.

<center>

| **Pricing plan** | **Price of plan** | **No. of users** | **Percentage** |
|---|---|---|---|
| 2 options | £3 | 8 | 40% |
| 2 options | £5 | 12 | 60% |
| 3 options | £3 | 3 | 15% |
| 3 options | £5 | 17 | 85% |

</center>

Again, we can use the z-test to assess the statistical difference between the proportions calling R and typing ```binom.test(x=c(17,3), p=0.5, conf.level = 0.95)```. The returned *p*-value is ```0.003```, below the threshold of 0.05. Therefore, **the 3-option plan, which used the middle option as a decoy alternative, increases the chances users will engage with the community**. I also estimated the 95% confidence intervals and I added them to the bar plot so that the effects can be visually inspected and more easily interpreted.

<img src="/projects/case_study_pricing_plans_files/Percentage_preference_prices_1000x600+CIs_b.png" alt="Preference based on available prices" width="700px" height="450px"/>


### Reflections

Although the described work might look straightforward, it required several attempts to create a likely pricing plan webpage, find the right price balance for the 2-option plan, and framing in the correct way the decoy option. To know more, just drop me an email, or leave a reply.

Although the results are promising, it is important to be aware that the experiment could only measure users’ intention to subscribe to plans ("*Read the plans available and their cost. Which one would you prefer?*"). The question now is, after being nudged to subscribe to the health community, do uses actively engage with it? Future research should be planned considering to collect data about subscribers’ behaviours.

##### Footnotes

[1]: Wang, Brede, Ianni, & Mentzakis (2018). [Social interactions in online eating disorder communities: A network perspective](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6066201/). PloS one, 13(7), e0200800.

[2]: Scheibehenne, Greifeneder, Todd (2010). [Can There Ever Be Too Many Options? A Meta-Analytic Review of Choice Overload](https://doi.org/10.1086/651235). Journal of Consumer Research, Volume 37, Issue 3, October 2010, Pages 409–425.

[3]: The "original" plan was tested a few times to get the right balance between Plan A and B.

[4]: The R Foundation. [*“What is R?”*](https://www.r-project.org/about.html)
