---
id: 945
title: Synergy Proxy using only SSH
date: 2013-03-11T16:43:07+00:00
author: tyghe
layout: post
guid: /?p=945
permalink: /synergy-proxy-using-only-ssh/
al2fb_facebook_link_id:
  - 43800887_911431132979
al2fb_facebook_link_time:
  - 2013-03-11T22:43:12+00:00
al2fb_facebook_link_picture:
  - 'avatar=https://secure.gravatar.com/avatar/22d9af95578240400eaaefc90157ded9?s=96&amp;d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96&amp;r=G'
original_post_id:
  - 945
categories:
  - How To
  - Technical Computing
tags:
  - local
  - proxy
  - putty
  - remote
  - ssh
  - synergy
  - synergy-foss
  - tunnel
---
I&#8217;ve recently had the need to setup a secure synergy proxy so that I could connect two machines that were firewalled from each other.

The process is actually quite simple.

I&#8217;m going to omit the configuration side of the synergy server and leave that up to you to figure out as it really doesn&#8217;t have too much to do with how this works.

For the purpose of this I&#8217;m going to call the synergy client &#8220;Client&#8221; and the synergy server &#8220;Server&#8221; just to make sure things are clear.

Also, for my setup my client was a Windows 7 machine and the server was a Linux machine. Should not matter since we are using SSH to do the proxy.

## You will need a few things

  * <a style="font-size:13px;" title="Synergy Foss" href="http://synergy-foss.org/" target="_blank">Synergy</a>
  * ssh client 
      * <a title="putty" href="http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe" target="_blank">Windows</a>
      * Linux/Mac/Unix just use the built in ssh client
  * Synergy server setup accepting connections(For this tutorial, I&#8217;m using the default port of 24800)
  * ssh-server setup on the server you will be proxying through with a valid account

Since you will be using a computer in the middle, I&#8217;ll just suggest it should be a *nix type computer and not even bother if you are going to use windows <img src="https://tygertown.us/wp-includes/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" />
  
The great thing about this is you don&#8217;t need any ports open on the client or server other than the ability to establish an ssh connection to the proxy server.

## The Setup

  1. On the client establish an ssh Local tunnel on port 24800 
      1. Putty Setup for Windows 
        <a href="/2013/03/synergy-proxy-using-only-ssh/puttylocaltunnel/" rel="attachment wp-att-946"><img class="alignnone size-full wp-image-946" alt="PuttyLocalTunnel" src="/wp-content/uploads/2013/03/PuttyLocalTunnel.png" width="466" height="449" /></a>
    
      2. or simply ssh -L24800:localhost:24800 <proxy server address goes here>
  2. On the server side do the exact same except you will do a Remote tunnel on the same port 
      1. Putty Setup for Windows 
        <a href="/2013/03/synergy-proxy-using-only-ssh/puttyremotetunnel/" rel="attachment wp-att-947"><img class="alignnone size-full wp-image-947" alt="PuttyRemoteTunnel" src="/wp-content/uploads/2013/03/PuttyRemoteTunnel.png" width="469" height="452" /></a>
    
      2. ssh -R24800:localhost:24800

You can have synergy client and synergy server running before the ssh tunnel setup since the client attempts to reconnect over and over. Once the ssh tunnel is up and running the client will connect to the server.
