---
id: 760
title: 'Leveraging Dropbox &#038; GIT'
date: 2011-08-03T03:59:55+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=760
permalink: /leveraging-dropbox-git/
wordbooker_options:
  - 'a:10:{s:18:"wordbook_noncename";s:10:"3539ff3f8d";s:18:"wordbook_page_post";s:4:"-100";s:18:"wordbook_orandpage";s:1:"2";s:23:"wordbook_default_author";s:1:"2";s:23:"wordbook_extract_length";s:3:"256";s:19:"wordbook_actionlink";s:3:"300";s:26:"wordbooker_publish_default";s:2:"on";s:18:"wordbook_attribute";s:31:"Posted a new post on their blog";s:29:"wordbooker_status_update_text";s:35:": New blog post :  %title% - %link%";s:20:"wordbook_comment_get";s:2:"on";}'
wp-esprit-picasa-meta-description:
  - 
wp-esprit-picasa-meta-title:
  - 
wp-esprit-picasa-meta-url:
  - 
wordbooker_thumb:
  - 
wordbooker_extract:
  - "Recently I have been using GIT so much that I've been considering upgrading my Github account. The problem is, I don't want to pay $7 a month for another service. Yes, yes I know Github is very super awesome and I should probably just pay for the servi ..."
original_post_id:
  - 760
categories:
  - Technical Computing
tags:
  - dropbox
  - dyndns
  - git
  - github
---
Recently I have been using GIT so much that I&#8217;ve been considering upgrading my <a title="Necrolyte2's GitHub" href="http://www.github.com/necrolyte2" target="_blank">Github</a> <span>account. The problem is, I don&#8217;t want to pay $7 a month for another service. Yes, yes I know Github is very super awesome and I should probably just pay for the service, BUT&#8230;why when you can make something similar</span> using free services.<!--more-->

<span>Now this obviously doesn&#8217;t have all the awesomeness that Github has, but if you want personal <span>repositories</span> and have a computer at home then you can do this.</span>

  1. Get and install <a title="Dropbox" href="http://www.dropbox.com" target="_blank">Dropbox</a> if you have not already.
  2. <span>Create a folder wherever you want in your Dropbox folder(I suggest in the root of your Dropbox) and name it GITREPOS. You can name it whatever you want, just remember the path.</span>

<span>Now, whenever you want a new <span>repo</span> you should make a bare one in your <span>dropbox</span> folder like so</span>

>  <span>git <span>init</span> &#8211;bare <path to GITREPOS>/<name of new git <span>repo</span>>.git</span>

<span><span>Ok</span> now you have a bare git <span>repository</span> sitting in your GITREPOS directory which is synced, backed up and all that Dropbox goodness, but how to get to it from another computer?</span>

<span>You can either install Dropbox on that computer which takes forever if you have a lot of stuff in your Dropbox account already. OR, you can use</span> Dynamic DNS.

Setup <a title="DynDNS" href="http://www.dyndns.com/" target="_blank"><span><span>DynDNS</span></span></a> on whatever computer you want to do the GITREPO stuff on.

<span>I actually set up <span>DynDNS</span> with 2 hosts.</span>

  * One for my laptop
  * One for just my home network.

<span>So I have a <span>hostname</span> for my laptop that points to it wherever my laptop goes and I also have one dedicated on my home network(I have DynDNS update my home network from my WRT54G. Make sure to forward Port 22 for ssh)</span>

<span>* Note: You can use whatever dynamic <span>DNS</span> service you want. I have just used <span>DynDNS</span> in the past so stuck with it.</span>

You now have:

  * <span>Dropbox syncing your GITREPOS to any computer you setup Dropbox on</span>
  * <span>Dynamic DNS <span>hostname</span> pointing to your computer with your GITREPOS</span>

To complete your Jedi training you should also probably setup some SSH keys for your new host. I&#8217;m not going to go into details on that, but it is quite easy an there is a lot via a <a title="Let Me Google That For You ssh keygen" href="http://lmgtfy.com/?q=ssh+keygen" target="_blank">Google search</a> about it.

Now that you have full Jedi powers you can do

> <span>git clone <my <span>dyndnshost</span>>:<path to git <span>repo</span> in my <span>dropbox</span>></span>