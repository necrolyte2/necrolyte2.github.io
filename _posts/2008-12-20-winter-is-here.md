---
id: 129
title: Winter is here
date: 2008-12-20T13:23:25+00:00
author: tyghe
layout: post
guid: /blog/?p=129
permalink: /winter-is-here/
original_post_id:
  - 129
categories:
  - General
  - Technical Computing
  - weather
---
I&#8217;m going to spare you the typical ranting about snow, ice, and the horrid cold this time. What I really want to talk about is all the sweet things going on at work. Starting about six months ago I started doing System Administration work for Academic computing. This was only suppose to be about 50% of my time. Well that has changed quite a bit and I see myself really working about 75-80% SysAdmin and the rest managing the labs on campus.

The SysAdmin stuff has been really exciting as we are trying to build infrastructure for the University so that academics actually have services that they can rely on as well as actually get. Prior to this there really was nothing at all for a researcher or instructor if he/she wanted any kind of technology resource.

Our main focus right now is to build a couple of core services for ourselves that will allow us to provide second tier services for the academic community such as webservers, database, blogs, forums, wiki&#8217;s&#8230;.

To do this we needed the following:

MySQL Cluster
  
MSSQL Cluster
  
Virtualization Cluster
  
Disk Cloud
  
Compute Cloud

Its not just as simple as creating say a MySQL server on a server and allowing connections to it though. Each of these services has to be created in such a way that if a physical server were to die some sort of fail over would take place and any users or applications that were using them at the time should barely notice the outage.

While this list seems quite small, achieving each is quite the project. In order to get each of these done we needed physical space which we finally got a while ago in the CCB. This then required a major overhaul of that rooms cooling and power, of which is almost done. For now we are just getting things moved around in the room so that we can get the servers into racks and the networking squared away.

For those of you who are working in the academic community at MSU you can expect to have some pretty cool tools to support your research or classes in the near future.
