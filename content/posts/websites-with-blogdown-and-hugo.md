---
title: Websites with Blogdown and Hugo
author: Andrea Scalco
date: '2020-07-17'
slug: websites-with-blogdown-and-hugo
categories: []
tags:
  - R
  - Websites
draft: yes
---


## Problem


## The easy way

One easy solution is to upload to a GitHub repo only the files required to publish the website and then let Netlify deploy them. This can be achieved in few steps.

1. In RStudio, build your website locally using blogdown::build_site(). This will create a new directory called "public" that will contain your website files (pages, posts, theme files, etc.).
2. Upload the entire content of "public" to a GitHub repo.
3. Access Netlify. Click "New site from Git". Choose the repository previously created.
4. Done. Netlify will render the website in few minutes.

Although easy, the downside of this solution is that whenever you want to publish something new you will have to manually upload the files to the GitHub repo. So, this 



 Blogdown R-project is under version control; when local files changes they are  uploaded to your GitHub repository; Netlify will "keep an eye" to the GitHub repository and when it will see changes will re-deploy the changes to the website


## Connect to GitHub repo

For this, I will assume you have already installed Git on your machine. To check if Git is installed, run ```shell git which``` to see the installation folder, and ```shell git --version``` to check the installed version. To put under version control the project from RStudio, type the following instructions in the console.

1. To get started, introduce yourself to Git providing username and email. If this is the first time, it will ask for the password.
```shell
config --global user.name "Forename Surname"
config --global user.email forenamen.surname@provider.com 
```

2. Initialise the working directory with
```shell
git init 
```
If you close and re-open the project RStudio will add a new panel on the upper right corner, which provides a GUI for working with Git.

3. 


## How to publish a post from now on
Let's recap: your. So, the hardest part is gone. Now, to create a post:

1. Use the Blogdown addin in the RStudio toolbar (Addins > New Post), a friendly alternative to blogdown::new_post(). See here for more info: https://bookdown.org/yihui/blogdown/rstudio-ide.html. Otherwise, copy and edit one of the previous posts. Acceptable files are .md/.Rmd/.Rmarkdown.

2. Work on your post. When ready change "draft:" from "yes" to "no". 

2.a. If the post is a simple text (.md), then the post will be rendered automatically by Netlify's Hugo. So, it is sufficient to upload it to the remote repo. MD files can contain piece of codes, but their only aesthetic, code will not be executed.

2.b. If the post is a Rmarkdown file (.Rmd/.Rmarkdown), then Netlify will not render it automatically because it would require running R. A easy-to-follow strategy is to serve the website locally. This will execute the Rmarkdown file. It will also produce the associated files (e.g. plots), and move them into /static.  Rename the extension of the original file (like, ".Rmd.ign""): this will make sure the file is not executed anymore, and you are free to preview your website locally using serve_site() only for the new files. Upload all the output files produced by serving the site to the remote repo: Netlify will publish the new post neatly.

Do not use "knit" for Rmarkdown file. Although it will produce an HTML file, this will not contain the plots produce by chunks of codes. Plus, it will produce a heavier HTML file compared to serve_site().

Why rename the Rmd file? This will avoid that  if destination URLs or APIs change. For instance, I have a Rmarkdown file that use gtrendsR to get data from Google trend: now it works fine, but the API later gets updated and I use serve_site() the RMarkdown file will throw an error or it might get the data but with dates different from the ones I saw, and the analysis will not be valid. That's a bad thing, you cannot check all your posts and leave with the fear they might change. Plus, it makes serve_site() faster, given that it only has to work on the newest file, rather than rendering all files.

3. The previous operation will take the posts under the content folder and render them in HTML. When you save a post, you should see the Git panel of RStudio showing you the file just saved ready to be staged, commited, and finally pushed to the GitHub repository.

## If Netlify refuses to apply a theme 
When rendering the website locally things look (usually) good. Things get serious when you want to deploy the website on services like Netlify. Overall, using Blogdown+RStudio the process went smooth, except for the fact that the first time the website looked like very 90s because Netlify did not found any theme. That is because I forgot a backslash. 

When working on your local machine the website will be 127.0.0.1, when deploying you will need a custom URL. Netlify provides one for free. The URL can be changed to some degree, but it will always come with the suffix "netlify.app". Now, be sure that the baseURL in config.toml is the same you are using on Netlify (e.g. "https://forenamesurname.netlify.app/"). Especially, *pay attention to the slash at the end of the URL*. Why? When Netlify takes all files from you GitHub repository the website will be the base URL, meaning that that the directory tree will be built starting from that (a bit like "C:"). However, Netlify does not place a slash from the base URL automatically, so you got to add it by yourself. I saw another solution that suggest to create an environmental variable ("baseURL = /") inside netlify.toml, but IMHO to edit the config.toml file is safer in case in the future you might encounter the same problem and not remember how you solved it. If you had problem rendering the theme this might be one cause: withouth the slash I found that Netlify was looking for the css files in andreascalco.netlify.appccs rather than andreascalco.netlify.app/ccs.

Also, be careful to use the right HUGO version. Blogdown suggests to use at least version 0.20, but as today (July 2020) that is a bit old. *How to know what version to use for your theme?* Go to the theme repository, it is likely you will find a netlify.toml file. Look for the environmental variable "HUGO_VERSION". 
