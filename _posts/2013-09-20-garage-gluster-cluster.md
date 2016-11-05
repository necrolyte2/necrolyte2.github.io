---
id: 963
title: Garage Gluster Cluster
date: 2013-09-20T08:01:15+00:00
author: tyghe
layout: post
guid: /?p=963
permalink: /garage-gluster-cluster/
al2fb_facebook_link_id:
  - 43800887_1000036731649
al2fb_facebook_link_time:
  - 2013-09-20T14:01:20+00:00
al2fb_facebook_link_picture:
  - 'avatar=https://secure.gravatar.com/avatar/22d9af95578240400eaaefc90157ded9?s=96&amp;d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96&amp;r=G'
original_post_id:
  - 963
categories:
  - How To
  - Technical Computing
tags:
  - centos
  - gluster
  - home built
  - linux
  - nas
  - server
  - xfs
  - zfs
---
Recently I had the realization that all of my pictures from the past 10 years were sitting on a single hard drive just waiting to be swept off into deleted land with the next hard drive failure.

My first thoughts were, put them in Dropbox. Ohh wait, I have 80GB of photos and don&#8217;t want to pay for an upgraded Dropbox plan(~$10/mo for 100GB). How about Google Drive? Much cheaper for the same amount of storage(~$5/mo for 100GB). Well, maybe I&#8217;ll think about how I can do a fun project at home since I actually need more like 2-3TB of storage to hold all of my &#8220;backed up&#8221; movies.

UPDATE: [Here is the post](/2013/09/garage-gluster-cluster-hardware/ "Garage Gluster Cluster Hardware") with all of the more detailed setup/specs

<!--more-->

I already have a Drobo 2nd Generation, but it is getting older and I&#8217;ve noticed that the Drobo products have a bit of a performance problem. I can&#8217;t ever seem to get more than 2-3MB/s transfer speed from it through the Drobo Share and the Drobo unit itself seems to get really bogged down when any amount of I/O happens on it.

### Requirements

  * Redundant storage in case of failures
  * Exports NFS & CIFS/Samba
  * 2-3 TB of usable space
  * Fast(I didn&#8217;t really know what Fast was at this point other than >3MB/s)

### Options

  * Pay for <a title="Dropbox" href="http://www.dropbox.com" target="_blank">Dropbox</a>
  * Pay for <a title="Google Drive" href="http://drive.google.com" target="_blank">Google Drive</a>
  * Build a file server

So really, the only option left is building my own file server. This really isn&#8217;t a hard task, but I wanted to take it a bit further and try out <a title="GlusterFS" href="http://www.gluster.org/" target="_blank">GlusterFS.</a> Lucky for me I just happened to have some spare computers and five 1.5TB drives as well as a few smaller drives laying around.

### Available Hardware

  * 1 Dell Vostro 200(4GB RAM)
  * 1 home built PC(Intel Core2Duo w/ 2GB RAM)
  * 1 Dell &#8220;Pizza Box&#8221; Server(AMD 4 core w/8GB RAM)
  * *4 Seagate 1.5TB Barracuda
  * 1 WD Green 1.5TB

* One of the Seagates already had all of my data on it so I couldn&#8217;t use it in the setup.

## The Plan

### Gluster Setup

Run Gluster in a Replica setup over 2 nodes

### Gluster Nodes

The Vostro and home built computer would both have 3 drives in them. One drive for the operating system and 2 drives stripped for performance. This would give each node about 2.7TB of usable space. The OS that I chose to use for this was CentOS 6.4 as it seemed to be a fitting choice for this project since Red Hat is the main supporter of Gluster and <a title="CentOS" href="http://www.centos.org/" target="_blank">CentOS</a> is basically a clone of <a title="Red Hat Linux" href="http://www.redhat.com/" target="_blank">RHEL</a>.

I wanted to try out ZFS so I could play with deduplication and compression. ZFS is <a title="ZFS on Linux" href="http://zfsonlinux.org/" target="_blank">ported</a> to Linux and there was a Gluster <a title="Gluster on ZFS" href="http://www.gluster.org/community/documentation/index.php/GlusterOnZFS" target="_blank">HowTo</a> so why not try it out.

### NFS/CIFS Server

Simply run CentOS on the Dell server and mount the GlusterFS and export it through NFS and Samba4.

## Results

### ZFS Testing

I got the Vostro setup following the Gluster on ZFS guide that I lined above. I setup the ZFS pool as they stated.

Then I used <a title="IoZone" href="http://www.iozone.org/" target="_blank">iozone</a> on the volume to test its performance. It became apparent quite quickly that there was something wrong. The speeds with smaller files was what you would expect(120MB/s+) but as soon as it got to the 256M, 512M & 1GB files the sustained writes went right into the crapper. I was getting sub 1MB/s speeds. Now I don&#8217;t know enough about ZFS, nor really disk I/O, but I suspected it had to do with either the ZFS install or the disk controller on the MB. Regardless, I didn&#8217;t really want to spend the time to debug the issue. The easy solution was to simply switch to LVM+XFS. A few minutes later I had a LVM volume with XFS on it. At this point I was doing simple dd commands to do the tests with a 1M block size and 512MB test file. XFS was doing anywhere from 180MB/s &#8211; 250MB/s. It was inconsistent, but good enough for me.

### GlusterFS Testing

Now I was ready to install the next node and setup the GlusterFS. Fast Forward a bit and the 2nd node was up and running. I had both nodes connected to a cheap DLink 5 port Gig switch at this point. I was pretty impressed at how easy it was to setup the replica set given it was more or less just a single command. I did the same quick dd test that I had done on both nodes on the XFS partitions and got something like 70-80MB/s. Seems good enough for a home storage solution. Just to check and see I removed the replica set and setup a strip set over the two nodes and did the same test. Pretty amazing, 105-110MB/s write speeds. I was pretty excited at this point, but had to rein it back in a bit and switched back to the Replica setup.

### NFS/CIFS Testing

This really wasn&#8217;t anything to special. Just your standard CentOS install with the two internal disks software mirrored. I then installed the nfs server packages and Samba4. The biggest pain in the butt was getting Samba4 setup correctly so that I didn&#8217;t have to authenticate. This is a home storage solution so I don&#8217;t really care about security that much. I want usability! I don&#8217;t remember actually doing the dd tests at this time because I was tired of not being able to watch movies at night(This project was spread over about 4 nights) so just wanted to get my data onto the Cluster and get on with life.

## Final Setup Results

All I can say was my wife couldn&#8217;t understand how excited I was transferring files from my computer to the storage cluster. She just doesn&#8217;t understand that 50-80MB/s transfer speeds is AMAZING! Maybe not anything special if you are transferring over USB3 or something, but over a network! Yes it is pretty great considering the whole setup was basically crappy commodity hardware piled together. I still need to get a small report script going so I get emailed disk status and such every week so I know if a disk dies or something along those lines but for now I&#8217;m pretty dang happy with the result.

When I get a chance I&#8217;ll post up all of the commands and more specific hardware specs for everything in another post and link it in here. Probably put in some pictures of my Garage Gluster Cluster.
