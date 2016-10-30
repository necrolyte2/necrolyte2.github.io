---
id: 106
title: Converting from Xen to KVM
date: 2008-10-31T13:25:28+00:00
author: tyghe
layout: post
guid: /blog/?p=106
permalink: /converting-from-xen-to-kvm/
original_post_id:
  - 106
categories:
  - Technical Computing
tags:
  - disk image
  - kvm
  - migrate
  - script
  - xen
---
So it has become quite apparent that Xen is to be replaced by KVM in the virtulization world. This comes from the latest Ubuntu/Fedora news of them adopting KVM. This of course can leave some stranded Xen users out there trying to get their VM&#8217;s ported to kvm.

We had this happen at work after building some 40 Xen instances before we realized we needed to make the switch. Of course its not just as easy to just make a KVM xml config that uses the Xen disk image as the underlying infrastructure of Xen differs a bit. Xen images typically don&#8217;t have the kernel installed inside them nor do they have a bootable disk image.

I spent the better part of the last few days creating a step by step walk through of how to create a KVM disk image, copy the data from the Xen image to this one and then do miscellaneous tasks on the new image to make it work. That was all fine and dandy but required a lot of manual work which would be way to much for converting 40ish instances.

So I present you with the scripts to make your life easier.

The scripts require ubuntu-vm-builder to work properly

Note: These scripts really have not been 100% tested but they have been working quite well so far. If you have problems using them please let me know.
  
<a href='/blog/?attachment_id=108' rel='attachment wp-att-108'>xen-to-kvm</a>
  
<a href='/blog/?attachment_id=107' rel='attachment wp-att-107'>create-xml</a>
