---
id: 969
title: Garage Gluster Cluster Hardware
date: 2013-09-21T08:03:19+00:00
author: tyghe
layout: post
guid: /?p=969
permalink: /garage-gluster-cluster-hardware/
al2fb_facebook_link_id:
  - 43800887_1000494813649
al2fb_facebook_link_time:
  - 2013-09-21T14:03:23+00:00
al2fb_facebook_link_picture:
  - 'avatar=https://secure.gravatar.com/avatar/22d9af95578240400eaaefc90157ded9?s=96&amp;d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96&amp;r=G'
al2fb_facebook_image_id:
  - 979
original_post_id:
  - 969
categories:
  - How To
  - Pictures
  - Technical Computing
tags:
  - centos
  - cluster
  - dell
  - gluster
  - nas
  - poweredge
  - xfs
  - zfs
---
<a title="Garage Gluster Cluster" href="/2013/09/garage-gluster-cluster/" target="_blank">As promised</a> here is the more specific post on all of the hardware and how everything is setup.

<div id='gallery-3' class='gallery galleryid-969 gallery-columns-4 gallery-size-thumbnail'>
  <dl class='gallery-item'>
    <dt class='gallery-icon portrait'>
      <a href='/img_20130921_080710/'><img width="113" height="150" src="/wp-content/uploads/2013/09/img_20130921_080710.jpg" class="attachment-thumbnail size-thumbnail" alt="Enterprise Storage Cluster TopView" aria-describedby="gallery-3-979" /></a>
    </dt>
    
    <dd class='wp-caption-text gallery-caption' id='gallery-3-979'>
      Enterprise Storage Cluster TopView
    </dd>
  </dl>
  
  <dl class='gallery-item'>
    <dt class='gallery-icon portrait'>
      <a href='/img_20130921_080921/'><img width="113" height="150" src="/wp-content/uploads/2013/09/img_20130921_080921.jpg" class="attachment-thumbnail size-thumbnail" alt="Enterprise Switch Infrastructure" aria-describedby="gallery-3-982" /></a>
    </dt>
    
    <dd class='wp-caption-text gallery-caption' id='gallery-3-982'>
      Enterprise Switch Infrastructure
    </dd>
  </dl>
  
  <dl class='gallery-item'>
    <dt class='gallery-icon portrait'>
      <a href='/img_20130921_080723/'><img width="113" height="150" src="/wp-content/uploads/2013/09/img_20130921_080723.jpg" class="attachment-thumbnail size-thumbnail" alt="Enterprise Storage Cluster FrontView" aria-describedby="gallery-3-980" /></a>
    </dt>
    
    <dd class='wp-caption-text gallery-caption' id='gallery-3-980'>
      Enterprise Storage Cluster FrontView
    </dd>
  </dl>
  
  <dl class='gallery-item'>
    <dt class='gallery-icon portrait'>
      <a href='/img_20130921_080936/'><img width="113" height="150" src="/wp-content/uploads/2013/09/img_20130921_080936.jpg" class="attachment-thumbnail size-thumbnail" alt="Enterprise Switch Hardware" aria-describedby="gallery-3-983" /></a>
    </dt>
    
    <dd class='wp-caption-text gallery-caption' id='gallery-3-983'>
      Enterprise Switch Hardware
    </dd>
  </dl>
  
  <br style="clear: both" />
</div>

As you can see in the pictures this is definitely not an enterprise solution, but it would be very easy to convert it into an enterprise solution for fairly cheap.

I hope you take notice to my brilliant craftsmanship on the small wooden rack that it all sits on

<!--more-->

Here is the detailed hardware list listed by their hostnames:

## <span style="font-size:.83em;">GS01</span>

  * <a title="G41M-P33 Combo" href="http://www.msi.com/product/mb/G41M-P33-Combo.html#/?div=Detail" target="_blank">MSI G41M-P33 Combo</a>
  * 1 x Intel(R) Core(TM)2 Duo CPU E6750  @ 2.66GHz
  * 2GB RAM
  * 2 x Seagate 1.5TB Barracuda(ST31500341AS w/ CC1H firmware)
  * 1 x <a title="Hitatchi Deskstar Search" href="https://www.google.com/search?q=HDS722525VLSA80&oq=HDS722525VLSA80&aqs=chrome..69i57j69i61.802j0&sourceid=chrome&espvd=210&es_sm=93&ie=UTF-8" target="_blank">Hitatchi Deskstar</a>
  * 1 x inland PCI Ethernet Card(RTL8169 Chipset)

## GS02

  * Vostro 200
  * 1 x  Intel(R) Celeron(R) CPU 440  @ 2.00GHz
  * 4GB RAM
  * 1 x Seagate 1.5TB Barracuda(ST31500343AS)
  * 1 x WD 1.5TB(WD15EVDS-63V9B0)
  * 1 x <a title="Hitatchi Deskstar Search" href="https://www.google.com/search?q=HDS721050DLE630&oq=HDS721050DLE630&aqs=chrome..69i57j69i61.721j0&sourceid=chrome&espvd=210&es_sm=93&ie=UTF-8" target="_blank">Hitatchi Deskstar 500GB</a>
  * 1 x Trendnet Gigabit Card

## Vallendrez

  * Dell PowerEdge SC1435
  * 1 x Quad-Core AMD Opteron(tm) Processor 2350
  * 8GB RAM

## Comments on my hardware adventures for amusement:

The Dell Vostro 200 I found next to the garbage upside down, like a dead fish  <img src="/wp-includes/images/smilies/frownie.png" alt=":(" class="wp-smiley" style="height: 1em; max-height: 1em;" />So I took it up to my apartment just to see if it would start, and it did. That was one of the greatest finds I have ever found. The hardware is not that great, but it was our main file server for over a year and now he has friends that he can play with that help him do his job better.

My friend gave me an almost brand new AMD/NVidia computer just the other week. My wife had previously been using the hardware for GS01 so I gave her the new computer and used her hardware for the Gluster node. What is funny about this is that my friend Ronnie had given me a bunch of his spare parts that we had built her computer with.

The same friend that gave me the computer had given me the Dell server about 3-4 months ago. Somebody gave it to him and he had no use for it. Thanks Tony!

I felt this section necessary to show that I had really only invested about $400 into all of the equipment that I used for this setup. Generous donations of random hardware provided the rest. Also, the inland 10/100/1000 cards are only $4 at MicroCenter. Haha, so now I have 3 of them. Why not right?

## Gluster Node Setup

  1. Head over to <a title="CentOS" href="http://www.centos.org" target="_blank">CentOS</a> and download the <a title="CentOS 6.4 Minimal ISO" href="http://centos.mirror.ndchost.com/6.4/isos/x86_64/CentOS-6.4-x86_64-minimal.iso" target="_blank">6.4 ISO</a>
  2. Burn it to a cd or do some fancy USB stick stuff with it so you can install it 
      * I didn&#8217;t do anything fancy in the install. Just format the OS drive ext4 and leave the other drives untouched
  3. Once you are finished with the install make sure to update with yum update
  4. Now you just need to get LVM setup
  
    > vgcreate VG0 /dev/sdb /dev/sdc
  
    > vcreate -L 2.63Tp VG0

  5. Now you have a software LVM strip group
  6. Repeat the above steps on the other node.
  7. Then simply follow the <a title="GlusterFS Quick Start" href="http://www.gluster.org/community/documentation/index.php/QuickStart" target="_blank">QuickStart Gluster Guide</a> 
      * The device that you create XFS on will likely be /dev/mapper/VG0-lvol0

## NFS/CIFS Server

  1. You will need to install the gluster yum repos to install the client
  2. yum install glusterfs-libs glusterfs-fuse glusterfs
  3. Mount the gluster filesystem and setup to be mounted on reboot
  
    > mkdir /space && echo &#8220;gs01:/data              /space                  glusterfs       defaults        1 2&#8221; >> /etc/fstab && mount -a

  4. Install Samba4
  
    > yum install samba4-libs samba4 samba4-client samba4-common

  5. Configure samba for passwordless guest login
  
    > mv /etc/samba/smb.conf{,.bk} && cat << EOT > /etc/samba/smb.conf
  
    > [global]
  
    > workgroup = SKYNET
  
    > netbios name = VALLENDREZ
  
    > map to guest = Bad User
  
    > null passwords = yes
  
    > guest account = tyghe
  
    > socket options = TCP\_NODELAY IPTOS\_LOWDELAY SO\_RCVBUF=65535 SO\_SNDBUF=65535 SO_KEEPALIVE
  
    > load printers = No
  
    > printcap name = /etc/printcap
  
    > dns proxy = No
  
    > log file = /var/log/samba/log.%m
  
    > max log size = 50
  
    > os level = 99
  
    > idmap config * : backend = tdb
    > 
    > EOT

  6. Make sure to change the guest account line to some account you have on the server and change the workgroup and netbios name.
  7. You will then need to configure some shares as well which I leave to you for fun. Here is an example to share the entire /space folder
  
    > [Space]
  
    > comment = Space
  
    > path = /space
  
    > browseable = yes
  
    > writeable = yes
  
    > read only = no
  
    > guest ok = yes
  
    > create mask = 0777
  
    > directory mask = 0777

  8. Restart and setup the service
  
    > service smb restart && service nmb restart
  
    > chkconfig smb on && chkconfig nmb on

##  Notes and Comments

So far the setup has been working awesome even though it is really a clobbered together setup. Random hardware, crappy switches, $4 network cards&#8230;Pretty amazing. There are some things I want fix about the setup though. First off, I didn&#8217;t read the man pages nor anything on Google about LVM. I know it is a pretty spectacular system and supports snapshots, but that is really the extent of my knowledge of it. I want to dive a bit deeper into my understanding of it so that I might set up snapshots and some other fun things. Maybe some optimizations.

As I stated in my previous post, I had initially wanted to give ZFS a try, but could not due to something. I would like to find out what that &#8220;something&#8221; is as ZFS is a pretty amazing FS. I would also like to look at BTFS maybe as well, but we will see.

I really would like to get some quick scripts running on the two nodes just to check FS integrity, Hard Drive health&#8230; I&#8217;m not sure what will happen if a drive dies on one of the nodes other than that node just exploding all over the place. If a drive dies in the LVM will it actually still write to the LVM and then replicate errors? I don&#8217;t know, but that sounds scary.

I think the idea of replacing the gluster nodes with some lower power devices would be a great project for the future as well. I have a feeling that our electric bill might be a bit higher soon. I might get a simple power monitor for the plug that they are all plugged into just to see the usage.

I&#8217;m very interested in hearing any comments, critiques and/or concerns any of you have.
