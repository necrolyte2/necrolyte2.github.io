---
id: 1180
title: Keeping your GitHub fork up-to-date
date: 2014-12-24T14:04:39+00:00
author: tyghe
layout: post
guid: /?p=1180
permalink: /keeping-your-github-fork-up-to-date/
categories:
  - How To
  - Technical Computing
tags:
  - fork
  - git
  - github
  - workflow
---
While this may seem trivial to those that have been working in a GitHub workflow for a while, I&#8217;ve just recently been working with others through GitHub and have had to learn how to do this.

So you start with either of two scenarios:

  1. You cloned the original repository to your local machine
  2. You cloned your fork of the repository to your local machine

Regardless of which scenario you start with, you need to end up with 2 remote branches:

  1. origin, which points to your forked GitHub project
  2. upstream, which points to the original GitHub project

So to normalize so we end up with these remote branches

### If Scenario #1

    
    git remote rename origin upstream
    git remote add origin https://github.com/YOURUSERNAME/PROJECT.git
    

### If Scenario #2

    
    git remote add upstream https://github.com/ORIGINALUSER/PROJECT.git
    

Alright, moving on&#8230;

So any time the upstream(original) project changes you will need to synchronize your fork on github(even after you are the one that submitted the pull request and it was merged)

To do this you should be able to issue the following commands

    
    git remote update
    git rebase upstream/master
    git push origin master
    

So essentially you are telling git to fetch all of your remote branches, then you are applying all changes from the upstream/master branch to your master so that both are in sync. Then you push your master up to your fork on GitHub. At the end, all 3 repositories&#8217; master branches(local, fork, original) will be in sync.

This does assume a few things especially that you do your edits in separate branches and that your local master branch is the same as your origin/master. This is the typical development workflow(I think).
