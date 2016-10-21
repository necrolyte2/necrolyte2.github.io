---
id: 1133
title: Install Python for your Account in Windows
date: 2014-03-28T09:57:28+00:00
author: tyghe
layout: post
guid: http://tygertown.us/?p=1133
permalink: /install-python-for-your-account-in-windows/
categories:
  - How To
  - Technical Computing
tags:
  - path
  - python
  - user
  - windows
---
Ever need to install Python for just your user account? Maybe you don&#8217;t have admin privileges or something to install it?<!--more-->

  1. First, download Python from <a title="Python 2.7.6" href="https://www.python.org/ftp/python/2.7.6/python-2.7.6.msi " target="_blank">here</a>
  2. Extract the msi to your Profile directory 
      1. Open a command window Start Button -> cmd
      2. mkdir %USERPROFILE%\python
      3. msiexec /a %USERPROFILE%\Downloads\python-2.7.6.msi /qb TARGETDIR=%USERPROFILE%\python
  3. At this point we have python sort of installed. You would have to type %USERPROFILE%\python\python.exe ever time you wanted to run python. We want to be able to just type python from anywhere and have it run 
      1. Setup your PATH and PATHEX variables by clicking the windows button and typing in environment and selecting the edit environment variables for your account
      2. Then setup Path and PATHEXT like in the image below[<img class="aligncenter size-full wp-image-1135" alt="path" src="http://tygertown.us/wp-content/uploads/2014/03/path.png" width="401" height="441" />](http://tygertown.us/wp-content/uploads/2014/03/path.png)
  4. You should be set to go. Open a command window and type python -V to see if it works
