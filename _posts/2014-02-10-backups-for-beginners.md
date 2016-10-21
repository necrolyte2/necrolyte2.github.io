---
id: 576
title: Backups for beginners
date: 2014-02-10T08:00:23+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=576
permalink: /backups-for-beginners/
wp-esprit-picasa-meta-description:
  - 
wp-esprit-picasa-meta-title:
  - 
wp-esprit-picasa-meta-url:
  - 
original_post_id:
  - 576
categories:
  - Uncategorized
---
It&#8217;s going to happen to you eventually. You are going to lose information saved on your computer. I&#8217;m guessing you have all of your data saved in a single spot. If you don&#8217;t good for you your one step ahead, but you can do more and it isn&#8217;t hard to do.

Eventually your hard drive is going to crash and burn. Especially if you have a laptop, you&#8217;re poor hard drive is just doomed at some point. It could be in a few years or it could be tomorrow or maybe before you are done reading this. Similar to how life operates you just never know when your ticket is up. Sure you can recover your data if your hard drive crashes, but it&#8217;s going to cost you and you just don&#8217;t know how much you will get back. Some of you may be thinking, well I have a second hard drive that I copy everything too so I&#8217;m set. Well you are really about 3/4 set in that case. How often do you copy your data to the second hard drive? What happens if you get a virus on your computer and it infects all of your files and you copy them over to your backup hard drive?<!--more-->

So here are a few fun ways to do backups cheaply and effectively(not the only ways, but they work well).

First lets go over some basic principals of backups

  * Raid / External Drive
  * Full Backup
  * Incremental Backups

### RAID / External Drive

RAID isn&#8217;t that nasty stuff you spray on bugs. It stands for **R**edundant **A**rray of **I**ndependent **D**isks. Basically you have multiple hard drives and when you save something on your computer it copies that data for you to all the hard drives for you.

External Drive is simply when you buy a USB/Firewire hard drive from Best Buy or wherever and connect it to your computer. This allows you to copy/move files from your computer onto the external drive.

These both will help protect you against single hard drive failures by having duplicate copies of your data.

### Full Backup

This is when you copy all the files that you want to back up to the place you want to back up too(destination). The destination can be anything really. Different folder on the same hard drive(not recommended), external hard drive, server&#8230;.

A good analogy would be if you were making a movie. You go and record scenes for your movie all on a single video tape. Then when you are done for the day you copy that video tape onto another video tape for a backup.

Full backups save you from hard drive failures and give you the ability to restore files from the last time that you did a full backup.

### Incremental Backup

An incremental backup is when you copy only the files that have changed since the last time you ran a full backup. Using incremental backups saves hard drive space as you are not copying all the files every time. This also allows you to do neat things like how Apple&#8217;s OSX&#8217;s Time Machine works.

If we add on to the movie analogy above in the Full Backup you would go out and record scenes for the movie on your primary video tape. The first time you run a backup you would copy all of your scenes onto another tape for a full backup. Then every time after that you would copy only the new scenes that you recorded that day onto another video tape and you would set that copy next to the full backup video tape.

Incremental Backups allow you to save space while also giving you the ability to restore files from the last time you ran a full or incremental backup.

# So you now have 2 options really for doing backups

## Have somebody else do it

Check out [www.backblaze.com](http://www.backblaze.com "Back Blaze")

  1. Sign up
  2. Download the client
  3. Start backing up

It&#8217;s that simple&#8230;really.

There are other services out there as well that you can use, I just think Backblaze is super simple.

## Do it yourself

So you are a do it yourselfer?

Doing it yourself is actually fairly easy. Each OS provides tools that you can use and even software that does this for you.

  * TimeMachine
  * Windows Backup
  * Various [Linux software](http://blogs.techrepublic.com.com/10things/?p=895 "linux backup software")

or you can build the backup yourself(I&#8217;m not going to do Windows instructions because Windows doesn&#8217;t have nifty easy tools like Rsync, cp, cpio. If you use Windows I suggest using the native windows backup tool or another free backup software)
