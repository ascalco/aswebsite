---
title: "Increase the chances to involve users using the decoy effect"
author: "Andrea Scalco"
date: "28/08/2020"
output: html_document
type: research-bites
---

Being part of a community of people who share the same values and interests can drastically increase the chances of successfully change individual food habits [1]. Here **I show how a 2-option pricing plan to an online health community can be restructed to increase users' intention to be involved** without altering the services offered. To this purpose, I leveraged one of my favourite Behavioral Economics phenomena: the decoy effect. Statistical analysis showed that customers preferring to be involved with the community **increased from 60% to 85%**.

### The bit about psychology

The emergence of SaaS brought to consumers a wide range of purchase options: monthly or yearly? How many services? For you or your team? Psychology showed that too many options can lead to unwanted consequences such as impairing choice and decreasing motivation. This cognitive phenomenon is known as "Choice overload" [2]. However, if alternatives are carefully selected, the addition of options can produce the opposite effect, guiding the choice towards a predefined alternative. This happens in the case of the "decoy effect": when consumers are faced with two options perceived equally valuable, they will tend to prefer one of the two options when a third one (called *decoy*) is added.
The third option should be carefully crafted considering some rules about cognitive perception of prices. Above all the decoy must be "asymmetrically dominated" by the option we would like user to prefer. This means that the third option should be similar but slightly worse at least in one attribute than the option that is going to be emphasised. Without diving into the details, Ariely beautifully explains this effect during [a recorded lesson on YouTube](https://www.youtube.com/watch?v=xOhb4LwAaJk)using as an example The Economists' subscription plans. Here I am going to do something similar. First, I will create a pricing plan with two equally valuable options. Then, I will revise the services offered to create a third option (the decoy). The addition of the alternative will move users' preference towards one of the two original alternatives.

### The original plan

First things first, I scouted different online platforms (e.g. Booksy, Dunked, Klets) and collected several pricing plans webpages to get me an idea of the prototypical structure. Following their example, **I designed in Figma a likely pricing plans webpage** for a health online community that I named HealthyU. Below I reported the 2-option pricing plan presenting users with two equally valuable plans [3].

The original plan: a 2-option pricing plan. The first plan entails a paid newsletter subscription, while the second adds the access to the health online community.

<img src="/projects/case_study_pricing_plans_files/Plans-2_Options-Updated.png" alt="2-option plan" width="700px" height="450px"/>

From the image you can see I am promoting two services: the first provides the subscription to a monthly newsletter, whereas the second add to the first the access to the online community. **My objective is to increase users' intention to be involved in the community without altering the number or types of service offered**. Although pretty basic, this example can be used as a starting point to show how the decoy effect work.

### Add a third option...to reduce uncertainty

The figure below shows the restructured pricing plan. Plan A is unaltered. The original Plan B remains at the right side but it has been renamed Plan C. Plan B is the decoy option: being better than Plan A but slightly worse than Plan C I expect it will move user preference towards the healthier plan, which give users access to the community. What the decoy does is to create the perception that for the same price you can subscribe to the community and get the newsletter "for free".

The original plan restructured to include the decoy alternative (middle option). The effect is that now Plan C appears to give the newsletter "for free".

<img src="/projects/case_study_pricing_plans_files/Plans-3_Options_with_decoy.png" alt="3-option plan" width="700px" height="450px"/>

### Plan and recruit

The decoy effect has been demonstrated in a number of studies and it has been deemed rather robust [4]. Therefore, a small sample of participants should be enough to obtain meaningful results. To make things more interesting, let's keep the budget low. So, websites that offer full-fledged research services are banned. Instead, I relied on **Qualtrics free plan** and **Amazon Mechanical Turk** (henceforth, MTurk). Long story short, I connected the two services by creating a random shared ID that helped me tracked respondents –keeping safe their anonymity. I then **recruited 20 participants for each condition** (the original 2-option plan vs. the 3-option plan). Overall, I got the responses after 12 hours (6 + 6, since Qualtrics allows only 1 active survey). I paid the participants and downloaded the responses. Overall, the total expenses for the study were about £5 (£0.10 per respondent, plus MTurk service fee).

### Results: a larger community

First, let's have a look at the preference for the 2-option pricing plan (see table and plot below). It seems that the preference is almost evenly distributed (Plan A: 40%; Plan B: 60%). To move behind intuition, I perform a z-test to assess if there is a significant difference from a random distribution (50:50). In R [5] this can be done with a single line of code: ```binom.test(x=c(12,8), p=0.5, conf.level = 0.95)```. If the resulting *p*-value is above 0.05 there is not a significant difference between the proportions, and we can effectively claim preferences are split half and half. The returned *p*-value is ```0.503```: **users are equally split between the two plans**.

Now, let's see how the 3-option pricing plan performed. I reported the results in the table and plot below. Looking at the bar plot, the majority of users (more than 60%) prefer Plan C. This might seem contradictory given that Plan C is equivalent to the original Plan B: this shift of preference is the result of adding an option in the middle that is better than than one option, but slightly worse than the one I would like users to prefer. Next, I will assess if there is a true statistical difference between the options of the renovated pricing plan.

Users' preference for the plans depending on the 2-option vs. 3-option pricing plan.

<center>

| **Pricing plan** | **Plan** | **No. of users** | **Percentage** |
|---|---|---|---|
| 2 options | Plan A | 8 | 40% |
| 2 options | Plan B | 12 | 60% |
| 3 options | Plan A | 3 | 15% |
| 3 options | Plan B | 4 | 20% |
| 3 options | Plan C | 13 | 65% |

</center>

Bar plot showing users' preference for the plans split by conditions (2-option vs. 3-option pricing plan).

<img src="/projects/case_study_pricing_plans_files/Percentage_preference_plans_1000x600.png" alt="Preference for pricing plans" width="700px" height="450px"/>

Since I am interested in seeing if the preference moved from the newsletter subscription to the subscription to the health online community, I collapse plan B and C (which both offer the access to the community). So, I have a £3/month plan (without access to the community) and a £5/month (access to the community). The resulting table of preference is reported below.

Users' preference for the plans by prices (£3/month to receive the newsletter vs. £5/month to access the online community).

<center>

| **Pricing plan** | **Price of plan** | **No. of users** | **Percentage** |
|---|---|---|---|
| 2 options | £3 | 8 | 40% |
| 2 options | £5 | 12 | 60% |
| 3 options | £3 | 3 | 15% |
| 3 options | £5 | 17 | 85% |

</center>

Again, the z-test can be used to assess the statistical difference between the proportions calling R and typing ```binom.test(x=c(17,3), p=0.5, conf.level = 0.95)```. The returned *p*-value is ```0.003```, below the threshold of 0.05. Therefore, **the  3-option plan, which used the middle option as a decoy,  increases users' intention to be involved to the community**. I  also estimated the 95% confidence intervals and I added them to the bar  plot so that the effects can be visually inspected and more easily  interpreted. The shift in preferences for the 3-option plan is rather visible.

Bar plot showing users' preference for the plans split by conditions (£3/month to receive the newsletter vs. £5/month to access the online community).

<img src="/projects/case_study_pricing_plans_files/Percentage_preference_prices_1000x600+CIs_b.png" alt="Preference based on available prices" width="700px" height="450px"/>


### Reflections

Although the described work might look straightforward, it required several attempts to create a likely pricing plan webpage, find the right price balance for the 2-option plan, and framing in the correct way the decoy option. To know more, just drop me an email, or leave a reply.

An unexpected result is the actual preference of some users for the decoy option despite the chance to pay the same price and get the newsletter. In this case, it would be interesting to conduct some qualitative research about the motivations of some users to avoid receiveing the newsletter.

It is important to note that the experiment could only measure users' intention to be involved to the community (i.e. their intention). The question now is, will users actually engage with the online community? For this data we will have to look at data about subscribers' behaviours.

##### Footnotes

[1]: Wang, Brede, Ianni, & Mentzakis (2018). [Social interactions in online eating disorder communities: A network perspective](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6066201/). PloS one, 13(7), e0200800.

[2]: Scheibehenne, Greifeneder, Todd (2010). [Can There Ever Be Too Many Options? A Meta-Analytic Review of Choice Overload](https://doi.org/10.1086/651235). Journal of Consumer Research, Volume 37, Issue 3, October 2010, Pages 409–425.

[3]: The "original" plan was tested a few times to get the right balance between Plan A and B.

[4]: Heath, & Chatterjee (1995). [Asymmetric decoy effects on lower-quality versus higher-quality brands: Meta-analytic and experimental evidence](https://academic.oup.com/jcr/article-abstract/22/3/268/1791719). Journal of Consumer Research, 22(3), 268–284.

[5]: The R Foundation. [*“What is R?”*](https://www.r-project.org/about.html)
