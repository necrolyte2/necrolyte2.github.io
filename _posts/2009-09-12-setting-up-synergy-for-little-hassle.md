---
id: 324
title: Setting up Synergy for little hassle
date: 2009-09-12T10:20:38+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=324
permalink: /setting-up-synergy-for-little-hassle/
original_post_id:
  - 324
categories:
  - Technical Computing
---
I tend to use my Mac Laptop at work a lot and that has spilled over into using it at home quite often as well. I got tired of having to switch from the keyboard and mouse of my desktop over to the laptop&#8217;s keyboard and mouse over and over when I needed to do something on it.

My Coworker at work has a similar setup and told me to try <a href="http://synergy2.sourceforge.net/" target="_blank">Synergy</a> so I thought I would give it a shot. Essentially Synergy allows you to connect expand screens of any computers onto a single computer.

For example

I put my laptop to the left of my screens at home and want to be able to use the keyboard and mouse from my main computer on my laptop.

<div id="attachment_323" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://tygertown.us/blog/wp-content/uploads/2009/09/HomeScreens.jpg"><img class="size-medium wp-image-323" title="Home Screens" src="http://tygertown.us/blog/wp-content/uploads/2009/09/HomeScreens-300x162.jpg" alt="Here you can see my dual monitors with my laptop to the left of them" width="300" height="162" /></a>
  
  <p class="wp-caption-text">
    Here you can see my dual monitors with my laptop to the left of them
  </p>
</div>

So setting up synergy I can now do this.

<!--more-->

Before we start, do note that synergy can run on virtually any Operating System(Windows, Mac, Linux, Unix) which is super nice

## Server Setup

I&#8217;ll go over the Linux & Windows setup as those are the only two that I have done

### Windows

* * *

#### Install Server

Go <a href="http://sourceforge.net/projects/synergy2/files/" target="_blank">here</a> and download the newest .exe file and run it(The install is trivial, so I&#8217;m not going to post directions for it)

#### Setup Server

##### Create Config File

Create a file called synergy.sgc and place it inside your My Documents or Documents path depending on if you have XP or Vista/7

> section: screens
  
> <server hostname>:
  
> switchCorners = none
  
> switchCornerSize = 0
  
> <client hostname>:
  
> switchCorners = none
  
> switchCornerSize = 0
  
> end
  
> section: links
  
> <server hostname>:
  
> left = <client hostname>
  
> <client hostname>:
  
> right = <server hostname>
  
> end
  
> section: options
  
> end

You will need to replace <server hostname> and <client hostname> with the output of the command hostname(run from a terminal or command window in windows) on the client and server

Not sure why, but wordpress doesn&#8217;t want to indent inside a blockquote so that file looks a bit messy, sorry.

##### Setup Autostart for Synergy

Create a file called SynergyAutostart.reg and place the following code into that file

> [HKEY\_CURRENT\_USERSoftwareMicrosoftWindowsCurrentVersionRun]
  
> &#8220;Synergy Server&#8221;=&#8221;&#8221;C:Program Files (x86)Synergysynergys.exe&#8221;  &#8211;no-daemon &#8211;debug WARNING &#8211;name llandru &#8211;address :24800&#8243; 

You will probably need to change the path to the actualy location of the synergys.exe file unless you are using 64bit Vista or 7

##### Insert registry entry

Simply double click the SynergyAutostart.reg file and it should prompt you if you want to insert something into your registry. Go ahead and click next and ok on whatever comes up

##### Test to see if it works

Now to make sure that the server is setup, open the start menu and find Synergy and run the server

It should have all the correct options specified so click Test, it should open a log file and run synergy. You can parse the dialogues that come up and determine if its working, the real test will be after the client is setup

You can Quit the app now

### Linux

* * *

#### Install Server

I&#8217;m not going to really bother too much about the install. Frankly, if you are using Linux, you know how to install it

You can use the link from the windows section if you want the source or an rpm, otherwise use apt-get or whatever

#### Setup Server

##### Create Config File

Create a file called .synergy.conf in your home directory with the same contents as the windows file replaceing <client hostname> and <server hostname> in the same manner

Test to see if it works

In a terminal issue synergys -f

It should spit a bunch of stuff to the screen. Like the Windows instructions, parse it and just check to see if it looks right

### Client Setup

#### Install Client

Because I&#8217;ve only setup the client on a Mac, those are the only instructions I&#8217;m going to post

The easiest way to get Synergy in my opinion for the mac is to download the Mac Version from <a href="http://sourceforge.net/projects/synergy2/files/" target="_blank">here</a>

Untar and decompress the download wherever

Copy/link/move synergyc to /usr/sbin that way you can just call synergyc from the command line without a path

* * *

## Test Client and Server

Ok, this is pretty much what we are after. Will it work or not

Execute the server either from the Windows GUI or Linux command line(just do it the same way you tested from the above steps in the install instructions)

On the client open a terminal and issue synergyc -f <server hostname or ip>

If your cursor moves to the center of the screen that&#8217;s an indication that its probably working. To know for sure just move the mouse on your Server over to the left and see if it move onto your client. If it does that means it worked, if it doesn&#8217;t you will want to check the server and client&#8217;s output for reasons why.

If it works now you are set. You can check out SynergyKM for Mac for a gui version to make this easier, or QuickSynergy for Linux

If your feeling randy you can continue reading to find out how to use a script I wrote to run the client so it connects securely.

## Extra L33t Script Instructions

* * *I wanted a way to simply execute the client and have it determine if my laptop was at home or at work and connect accordingly. At home I don&#8217;t require encryption on the connection from the client and server. At work I prefer it as you are sending raw keystrokes over the air for nasty people to nab and capture your passwords and emails about how you hate your boss, haha.</p> 

So I present you the script

> #!/bin/bash
> 
> \# Your home server&#8217;s ip
  
> homeserver=&#8221;&#8221;
> 
> \# Your work server&#8217;s ip
  
> workserver=&#8221;&#8221;
> 
> \# Does en0(wired) have link
  
> en0=\`ifconfig en0 | grep &#8216;media:&#8217; | egrep -o &#8216;active|inactive&#8217;\`
> 
> \# Does en1(wireless) have link
  
> en1=\`ifconfig en1 | grep &#8216;media: autoselect status:&#8217; | egrep -o &#8216;active|inactive&#8217;\`
> 
> \# If the wired connection has link use it
  
> if [ &#8220;${en0}&#8221; = &#8220;active&#8221; ]
  
> then
  
> interface=&#8221;en0&#8243;
  
> \# If the wireless connection has link use it
  
> elif [ &#8220;${en1}&#8221; = &#8220;active&#8221; ]
  
> then
  
> interface=&#8221;en1&#8243;
  
> \# Otherwise exit and print an error
  
> else
  
> echo &#8220;No interfaces appear to have link&#8221;
  
> exit -1
  
> fi
> 
> \# Determine the ip address of your machine
  
> ip=\`ifconfig ${interface} | egrep -o &#8216;inet ([0-9]{1,3}.){3}[0-9]{1,3}&#8217; | egrep -o &#8216;([0-9]{1,3}.){3}[0-9]{1,3}&#8217;\`
> 
> server=&#8221;&#8221;
> 
> \# Make sure no other synergy clients are running already
  
> killall synergyc
> 
> \# Is your ip a home ip(I think 192 is standard enough to assume for home NAT)
  
> echo ${ip} | grep -q 192
> 
> \# If the last command exited with a 0 then use
  
> if [ $? -eq 0 ]
  
> then
> 
> server=${homeserver}
  
> else
  
> server=&#8221;localhost&#8221;
  
> ssh -f -C -L 24800:${workserver}:24800 ${workserver} &#8220;killall synergys; synergys -f&#8221;
  
> fi
> 
> nohup synergyc -f ${server} &
> 
> exit 0

So basically this script determins if you are at home or at work and then connects to the server. If it determins you are at work it will connect to the server via ssh and actually execute the server for you and then connect the client to it.

Things you will need to do

  * Put that into a file in your home directory on your client Mac. The file is best if you append .command to the end so you can double click it
  * You will need to chmod 755 the file to make it executable
  * You need to change homeserver and workserver to the ip addresses of the computers
  * You will probably want to create an ssh key to auto log you in through ssh so you don&#8217;t have to enter in a password to connect the client

Well there you go.

Questions and Comments can be posted here and I&#8217;ll respond
