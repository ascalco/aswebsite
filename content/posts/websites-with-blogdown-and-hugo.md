---
title: Websites with Blogdown and Hugo
author: Andrea Scalco
date: '2020-07-17'
slug: websites-with-blogdown-and-hugo
categories: []
tags:
  - Data Science
  - R
draft: no
---


# Pitfalls and solutions:
When rendering the website locally things look (usually) good. Things get serious when you want to deploy the website on services like Netlify. Here are a couple of notes about my experience.

- When working on your local machine the website will be 127.0.0.1, when deploying you will need a custom URL. Netlify provides one for free. The URL can be changed to some degree, but it will always come with the suffix "netlify.app". Now, be sure that the baseURL in config.toml is the same you are using on Netlify (e.g. "https://forenamesurname.netlify.app/"). Especially, pay attention to the slash at the end of the URL. Why? When Netlify takes all files from you GitHub repository the website will be the base URL, meaning that that the directory tree will be built starting from that (a bit like "C:"). However, Netlify does not place a slash from the base URL automatically, so you got to add it by yourself. I saw another solution that suggest to create an environmental variable ("baseURL = /") inside netlify.toml, but IMHO to edit the config.toml file is safer in case in the future you might encounter the same problem and not remember how you solved it. If you had problem rendering the theme this might be one cause: withouth the slash I found that Netlify was looking for the css files in andreascalco.netlify.appccs rather than andreascalco.netlify.app/ccs.



# How to publish a post from now on
Let's recap: your Blogdown R-project is under version control; when local files changes they are  uploaded to your GitHub repository; Netlify will "keep an eye" to the GitHub repository and when it will see changes will re-deploy the changes to the website. So, the hardest part is gone. Now, to create a post:

1. Use the Blogdown addin in the RStudio toolbar (Addins > New Post), an friendly alternative to blogdown::new_post(). See here for more info: https://bookdown.org/yihui/blogdown/rstudio-ide.html. Otherwise, copy and edit one of the previous posts. Acceptable files are .md/.Rmd/.Rmarkdown.

2. Build locally the website calling blogdown::build_site().You can also use blogdown::serve_site() to render the inspect the website locally.

3. The previous operation will take the files in "content/", render them in HTML and store in public/. This will be actuall
