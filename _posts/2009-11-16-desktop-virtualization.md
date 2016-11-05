---
id: 381
title: Desktop Virtualization
date: 2009-11-16T18:13:09+00:00
author: tyghe
layout: post
guid: /blog/?p=381
permalink: /desktop-virtualization/
original_post_id:
  - 381
categories:
  - Technical Computing
tags:
  - fusion
  - linux
  - mac
  - parallels
  - ubuntu
  - virtualbox
  - virtualization
  - vmware
  - windows
---
I often find that people that are not familiar with virtualization are amazed when I open Windows on my Mac laptop. I figured I would go over virtualization a bit to help get the idea of the technology out there.

<!--more-->Essentially virtualization is running a virtual computer within your existing one. Think of a computer as a box of blinking lights and the operating system(Windows, Mac, Linux) as another box within that box. Then you can think of the virtulized computer as another box within the Operating System Box.

So the way it works is you have Windows, Linux or Mac running which is called the host operating system. Then you install virtualization software(VMWare, Parallels, Virtualbox&#8230;) on the operating system you have running. Then within that software you can create a virtual computer called the guest operating system that runs within your host operating system.

<div id="attachment_382" style="width: 430px" class="wp-caption alignright">
  <a href="/wp-content/uploads/2009/11/virtualizationexplanation.png"><img class="size-full wp-image-382" title="virtualizationexplanation" src="/wp-content/uploads/2009/11/virtualizationexplanation.png" alt="" width="420" height="300" /></a>
  
  <p class="wp-caption-text">
    Visual Explanation
  </p>
</div>

To help you visualize this I&#8217;ve created a super awesome image.

So to link everything to the picture your physical computer that you can touch is the Reddish box. When you turn on your computer and it starts up it loads your host Operating System which is the purplish blue box. Once that has loaded and you are logged in, you open up the guest operating system which is the green box.

Here are some screenshots to show what it looks like. I&#8217;m running Ubuntu 8.04 desktop for the host and Windows 7 as the Guest so for you Windows/Mac users it might look a bit different but the idea is the same.

<div id="attachment_384" style="width: 310px" class="wp-caption alignright">
  <a href="/wp-content/uploads/2009/11/FullScreenMode.png"><img class="size-medium wp-image-384" title="FullScreenMode" src="/wp-content/uploads/2009/11/FullScreenMode-300x120.png" alt="FullScreenMode" width="300" height="120" /></a>
  
  <p class="wp-caption-text">
    Full Screen Mode
  </p>
</div>

<div id="attachment_383" style="width: 310px" class="wp-caption alignleft">
  <a href="/wp-content/uploads/2009/11/WindowedMode.png"><img class="size-medium wp-image-383" title="WindowedMode" src="/wp-content/uploads/2009/11/WindowedMode-300x239.png" alt="Virtualbox Windowed Mode" width="300" height="239" /></a>
  
  <p class="wp-caption-text">
    Windowed Mode
  </p>
</div>

Here you can see the Guest OS running in Full Screen mode(I have 2 monitors so can dedicate it to the right monitor)

Here you can see the Guest OS running in windowed mode.

So you can see how this could be useful as each operating system has its flaws. So if you are on Linux or Mac and need to run a Windows application you can run a Virtual Windows instance with the application installed inside. If you are on Windows and need to run a Linux application you can virtualize Linux and run the app inside the Guest in the same way. Currently you cannot virtualize a Mac guest which is kind of a bummer. You can actually run multiple guests if you want, but you will want lots of ram to do that, so I would recommend only running 1 guest on a desktop computer. My Mac laptop has 4Gb of ram and runs a Windows guest pretty fast. My Ubuntu desktop at work has the Windows 7 guest running all the time and the computer isn&#8217;t noticeably slower. All of this does require that you have a newer processor(I think most processors out in the past year support virtualization) as well.

So now I&#8217;ll throw out a small chart of Pros and Cons

### Pros

  * Run Windows Apps in Linux or Mac or run Linux apps in Windows or Mac
  * Virtualization Software for all major Operating Systems
  * Can run multiple Operating systems if needed
  * Allows you to try out operating systems without rebooting or any changes at all to your current system.

### Cons

  * Need a processor that supports virtualization
  * Need quite a bit of ram
  * Some apps that require 3D rendering don&#8217;t work(although this is being fixed in newer versions of the virtualization software). You can&#8217;t run Linux and virtualize Windows to run your favorite game. Some games will run, but your better off trying something like [Wine](http://www.winehq.org/ "Wine")
  * If you run Windows, you still need to pay for the version of windows you install inside the virtual guest

Essentially, if you have enough RAM in your computer and a supported processor there are no drawbacks to doing this. Some of the virtualization software packages are expensive. Here is a list of the common ones that are used

  * VM Ware 
      * [Fusion](http://www.vmware.com/products/fusion/ "VMWare Fusion") &#8211; $80
      * [Workstation](http://www.vmware.com/products/workstation/ "VMWare Workstation") &#8211; $190
      * [Player](http://www.vmware.com/products/player/ "VMWare Player") &#8211; Free
  * Parallels 
      * [Desktop for Mac](http://www.parallels.com/products/desktop/ "Desktop for Mac") &#8211; $80
      * [Desktop for Linux/Windows](http://www.parallels.com/products/desktop/pd4wl/ "Desktop for Windows/Linux") &#8211; $80
  * [Virtualbox](http://www.virtualbox.org/ "Virtualbox") &#8211; Free

I&#8217;m really bias about the versions and will easily recommend Virtualbox to anybody. Here are 3 reasons why

  1. It is free. $0
  2. It is open source
  3. It works just as good as Parallels and VMWare

There you go. If you want to try it out and have more questions let me know.
