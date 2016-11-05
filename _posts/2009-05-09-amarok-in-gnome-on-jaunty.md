---
id: 224
title: Amarok in Gnome on Jaunty
date: 2009-05-09T12:23:40+00:00
author: tyghe
layout: post
guid: /blog/?p=224
permalink: /amarok-in-gnome-on-jaunty/
original_post_id:
  - 224
categories:
  - Technical Computing
tags:
  - amarok
  - gnome
  - gstreamer
  - jaunty
  - kde
  - sound
  - ubuntu
  - xine
---
Well I&#8217;ve just completed an adventure figuring out sound for Amarok in Gnome under Jaunty and feel it necessary to share the knowledge.

This of course assumes you have Jaunty and Gnome and not Kubuntu(which Amarok will probably work just fine in). Really this might not even matter as I was trying to allow Amarok to play through either my USB headset or my speakers and could not get Amarok to choose the one that I wanted.

Here is how to be able to choose between which one you want

## Installation

> sudo apt-get install amarok phonon-backend-xine kdebase-workspace

## Setup

> sudo systemsettings

Then go to Multimedia and you can select whatever audio device you want for KDE to use which in turn is how Amarok decides on how to play its sound.

I had to actually choose gstreamer as the backend device and then switch the hardware preferences in order to switch between my speakers and my USB headset. I see now that it has taken upon itself to switch back to xine, but its working and I don&#8217;t care anymore.
