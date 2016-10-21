---
id: 996
title: Cost of home computing
date: 2013-10-04T20:30:02+00:00
author: tyghe
layout: post
guid: http://tygertown.us/?p=996
permalink: /cost-of-home-computing/
al2fb_facebook_link_id:
  - 43800887_10100104722108289
al2fb_facebook_link_time:
  - 2013-10-05T02:30:08+00:00
al2fb_facebook_link_picture:
  - 'avatar=https://secure.gravatar.com/avatar/22d9af95578240400eaaefc90157ded9?s=96&amp;d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96&amp;r=G'
original_post_id:
  - 996
categories:
  - Technical Computing
tags:
  - dell
  - dropbox
  - electricity
  - gluster
  - google
  - kwh
  - pepco
  - poweredge
  - vostro
  - watt
---
In my last two posts I posted about my little storage cloud I created.

  * [Garage Gluster Cluster 1](http://tygertown.us/2013/09/garage-gluster-cluster/ "Garage Gluster Cluster")
  * [Garage Gluster Cluster 2](http://tygertown.us/2013/09/garage-gluster-cluster-hardware/ "Garage Gluster Cluster Hardware")

Looking back I see the reasons I set out to do that project were this:

  1. Need to make sure pictures(<100GB) from my life are somewhere safe. Check
  2. Need at least 2TB of space for media files that do not require backups and stuff really. Check
  3. Learn about Gluster, XFS, ZFS and other fun Linux stuff. Check
  4. The pictures portion needs to be cheaper than Google & Dropbox. Whoops!!

<!--more-->

I recently got a sweet gift for my Birfday. My Dad gave me a $20 gift card for Amazon and I bought a <a title="Amazon Kill A Watt" href="http://amzn.com/B00009MDBU" target="_blank">Kill A Watt Electricity Usage Monitor</a>. I&#8217;ve been wanting to get one of these and finally did because I had a feeling that my little project may be digging into the expense account a little too much.

I plugged the cluster into the device and turned on each unit one at a time and here are the readings after each device was on for a bit:

  * Dell SC1435 &#8211; 160 Watt
  * Dell Vostro 200 &#8211; 75 Watt
  * Thermaltake &#8211; 60 Watt

This is far from a perfect experiment to determine the values, but I&#8217;m guessing it is close enough to make a good decision if it is costing too much or not. So an hour later after poking around on our electric companies website(<a title="Pepco" href="http://www.pepco.com" target="_blank">Pepco</a>), <a title="Google Drive Pricing" href="https://support.google.com/drive/answer/2375123?hl=en" target="_blank">Google Drive Pricing</a>, and <a title="Dropbox Pricing" href="https://www.dropbox.com/upgrade" target="_blank">Dropbox Pricing</a> I created a nice spreadsheet to show how much it cost.

Here is the link to the spreadsheet: <a title="Cluster Electric Cost" href="https://docs.google.com/spreadsheet/ccc?key=0Av4DRxXYGQxJdFB2ZTJqUDRxbl95UTE5ZzN5dVFLNFE&usp=sharing" target="_blank">Spreadsheet</a>

So as you can see, the estimated cost to run that cluster 24/7 is about $42/mo. You can also see that it comes out to about $0.015/GB. This is interesting in that Google charges $0.05/GB and Dropbox charges $0.083/GB. So while having my own storage at home costs quite a bit less per GB it costs a lot more for what I actually require.

There are some other factors to take into account as well such as:

  * Google/Dropbox require no maintenance work on my part
  * Google/Dropbox are a cloud solution that does backups/version control of all files
  * Google/Dropbox are accessible anywhere
  * My solution is local making it much faster
  * My solution allows me to store anything I want and I don&#8217;t have to worry about prying eyes into my files
  * I could find lower power computers to run the cluster
  * I probably don&#8217;t need the cluster on 24/7(running it for 5hr/day comes out to be about $9-$10/mo)
