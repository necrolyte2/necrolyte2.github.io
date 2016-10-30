---
id: 141
title: Laconica and Postfix on Ubuntu
date: 2009-02-05T11:20:53+00:00
author: tyghe
layout: post
guid: /blog/?p=141
permalink: /laconica-and-postfix-on-ubuntu/
original_post_id:
  - 141
categories:
  - Technical Computing
tags:
  - laconica
  - postfix
  - ubuntu
---
Recently at work we tried to deploy <a href="http://laconi.ca/" target="_blank">Laconi.ca</a> which is a microblogging platform. We wanted to do this for 2 reasons. The first being the obvious, which is to be able to have a campus wide microblogging platform. The second, and what I think is the coolest, is that we wanted to use it to post our nagios alerts for our systems. Each monitored server will post its alerts to its own account on Laconi.ca and admins can subscribe themselves to whichever servers they see fit.

Now for the technical aspect of jumping the Postfix barrier to get the email submission to work. In the documentation for Laconi.ca it says to simply put the following into your /etc/aliases file

> *:/path/to/maildaemon.php

Well this is wrong for 2 reasons. First of all the syntax is incorrect. You need a | symbol before the script to say that you are piping the email to a command. The second reason which causes the most problems is the fact that /etc/aliases does not support the * wildcard on Ubuntu if at all. Its a security hole I guess. Here is how to work around this issue.

edit/create /etc/postfix/virtual and make sure this line is in there

> @<fqhn of your server> laconica

then run

> sudo postmap /etc/postfix/virtual

to compile the file for postfix to use

Now edit /etc/aliases and put this line in there

> laconica:|<full path to maildaemon.php>

make sure that the maildaemon.php is executable

> chmod 755 <full path to maildaemon.php>

then run

> sudo newaliases

now restart postfix just for a good time

> sudo /etc/init.d/postfix restart

Alright you should be able to send emails to the random mail address that Laconi.ca assigns to the user accounts under their profiles. Don&#8217;t make the same mistake I did and try to send an email from a different address than the one you registered your account with though, it won&#8217;t work <img src="https://tygertown.us/wp-includes/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" />
