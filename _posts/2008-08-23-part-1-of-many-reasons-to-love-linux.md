---
id: 83
title: Part 1 of many reasons to love Linux
date: 2008-08-23T10:15:20+00:00
author: tyghe
layout: post
guid: /blog/?p=83
permalink: /part-1-of-many-reasons-to-love-linux/
original_post_id:
  - 83
categories:
  - Rants
  - Technical Computing
tags:
  - dd
  - linux
  - mbr
  - windows
---
This is going to be a short one, but expect a huge post soon about how Linux saves lives.

I&#8217;ll just start out with why I&#8217;m writing this right now. I&#8217;m sitting in one of the labs that I manage finishing up some imagining. For those of you who don&#8217;t know what that is its simple. We have lots of computers that we want to be the same so we take a single computer and set it up the way we want and then take a snapshot of the harddrive and then we push that snapshot onto all of our computers.

So, we did that whole process with a few glitches here in Roberts 109. There are only 24 computers here but this lab has to have some special attention because of a few factors that I&#8217;m not going to go into. Anyways, while trying to diagnose a problem with the imaging yestarday I zero&#8217;d out the harddrives of 4 of the computers. Well this deleted the little chunk of the hard drive that tells the computer where windows(Called the Master Boot Record) is and how to load it when you turn on your computer. Great! So now when those 4 computers turn on they just stall at a screen that says &#8220;Booting&#8230;&#8221;  Prior to our wonderful little Linux/PXE setup(tech talk for linux that boots up on a computer over the network) we had to go to each computer and put the windows xp cd in and then wait about 6 minutes while it loaded the recovery console where you spent literally 2 seconds to fix the MBR. Leave it to windows to make you sit through 6 minutes of worthless stuff just so you can type in &#8216;fixmbr&#8217; and then restart the computer. Anyways, because I had quick access to linux I simply fired up those 4 computers into the Network Linux and then fired up a working computer into the Network Linux and then used one of the coolest commands in linux, dd.

> dd if=/dev/sda of=mbr.img bs=512 count=1

Then copied the mbr.img file from the good computer to the 4 bad ones and reversed the above command

> dd if=mbr.img of=/dev/sda bs=512 count=1

Essentially coping the mbr from the good computer to the 4 bad computers and whalla, they now work.

Love you Linux&#8230;
