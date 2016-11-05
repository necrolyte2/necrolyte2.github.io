---
id: 787
title: Your Home Wireless Network
date: 2011-10-13T12:59:13+00:00
author: tyghe
layout: post
guid: /?p=787
permalink: /your-home-wireless-network/
original_post_id:
  - 787
categories:
  - How To
  - Technical Computing
tags:
  - isp
  - router
  - setup
  - tutorial
  - wep
  - wireless
  - wpa
  - wpa2
---
WPA. WEP. 802.11. Encrypted. Pass-phrase. Uhhgg!! What do all these options mean? I just want to sit in my chair with my laptop and have it connect to my home wireless and know that it is setup securely.

I&#8217;ve set this stuff up enough for people and I understand your confusion. I&#8217;ll explain a bit about what each of the important parts are and how to setup your network to be as safe as you can get it with the least amount of hassle.<!--more-->First off, as of right now, you cannot create a 100% cracker proof wireless network at home. Just the same, right now you cannot create a 100% fail proof nuclear power plant. What you can do is create the safest possible network. The probability that somebody is going to crack your wireless network to get in and steal something off of your computers is pretty unlikely to begin with. Even if they do successfully crack your wireless network, they have to then hack into your computer. If you are still scared after reading this entire post let me know and I&#8217;ll custom build a tinfoil hat that you can wear to keep the aliens and government from stealing your thoughts 

# Your Internet

### Terms

  * ISP &#8211; Internet Service Provider(Qwest, Comcast, Verizon, Bresnan&#8230;)
  * Download &#8211; Internet traffic flowing into a device
  * Upload &#8211; Internet traffic flowing away
  * Modem &#8211; This device turns the cable your ISP runs to your house into Ethernet
  * Ethernet &#8211; Common networking cabling used

### Notes

<div>
  The type of internet you have really doesn&#8217;t matter that much. The two most prominent types of internet are aDSL and Cable. Some things to note though about the differences.
</div>

<div>
  <ul>
    <li>
      Cable usually has a lower upload speed than DSL due to it&#8217;s design
    </li>
    <li>
      DSL has a shorter maximum service area which is why it is rare to see it in rural areas as it degrades in service and speed by quite a bit the further it goes.
    </li>
    <li>
      Cable is a shared service and is why you can see degradation of service during peak usage more so than DSL as DSL is a direct line back to the ISP.
    </li>
  </ul>
  
  <h3>
    Speed
  </h3>
  
  <div>
    Now, about your internet speed. I rarely see ISP&#8217;s actually tell their customers what the speed is of their internet although you can call and ask them or maybe poke around on their website. When I last left Bozeman, MT Bresnan&#8217;s speeds were somewhere around 8Mb download and 1 Mb upload or so. Before that we had Quest DSL and had a 7Mb download and 1Mb upload.
  </div>
</div>

<div>
  <em><strong><span style="color:#000000;">The only thing you will want to know about those numbers is no matter how fast your home network is, you cannot download faster than the speed you get from your ISP.</span></strong></em>
</div>

### Your Modem

In order for you to connect to the internet you need to have a modem. Let us just pretend that the cable that comes into your house from your isp, wether it is cable or dsl, speaks a language we will call WanTalk(I&#8217;m making that up so don&#8217;t use it in a conversation as technical talk, haha). Your computer does not understand WanTalk nor does it have a port for the cable or dsl to plug into. This is why your ISP provides you with a Modem. The modem&#8217;s job is simply to be a translator that translates WanTalk into EthernetTalk which almost all computers can speak. Ethernet is also an actual computer term and is the name for one of the cables that comes with your Modem. Usually you will see Cat5 or Cat6 written on coating of the cable somewhere.

You plug the dsl or cable into the modem and then the ethernet into modem and turn it on and now you have a box that has blinking lights that don&#8217;t mean anything to you.

Usually modems will have the following lights:

  * Power &#8211; Is it on or off, Duh
  * DSL/Cable &#8211; Can the modem talk to the ISP&#8217;s servers. This is just the hardwire indication light. Can this modem talk to your ISP&#8217;s modem. Does not indicate you have internet connectivity.
  * Internet/WAN &#8211; You may or may not have this light, but if you do it indicates your modem can access the internet
  * LAN &#8211; Local Area Network. This indicates if the modem can communicate through the ethernet cable to another device.
  * WLAN &#8211; If your modem is also a Wireless Router this indicates if the Wireless network is on

<div>
  At this point you should understand everything in the following diagram
</div>

!["Home Network"](https://docs.google.com/drawings/pub?id=1wS-KqeyP2ErbKBQB1e6jQM_YN4Z_XVIaDnS7EcyYgnU&w=480&h=360)

<a title="" href="http://lh4.ggpht.com/-BzclvkMqfkY/TpcykHYYXgI/AAAAAAAAEGk/vWoMRjwv_W0/s800/IMG_20111013_134820.jpg" rel="lightbox[787]"><img src="http://lh4.ggpht.com/-BzclvkMqfkY/TpcykHYYXgI/AAAAAAAAEGk/vWoMRjwv_W0/s200/IMG_20111013_134820.jpg" alt="IMG_20111013_134820.jpg" /></a>You can see here a setup with a cable modem on the left and a wireless router on the right<a title="" href="http://lh6.ggpht.com/-pN32GtbzRQY/TpcyppkcTaI/AAAAAAAAEGg/i4KJZcayFE0/s800/IMG_20111013_134844.jpg" rel="lightbox[787]"><img src="http://lh6.ggpht.com/-pN32GtbzRQY/TpcyppkcTaI/AAAAAAAAEGg/i4KJZcayFE0/s200/IMG_20111013_134844.jpg" alt="IMG_20111013_134844.jpg" /></a> Here is the backside of each. The blue cable is the ethernet cable that connects to the wireless modem and the black cable at the bottom of the modem is the cable from the ISP.

# Home Network

In order to complete the most simple home network all you need to do is connect the ethernet cable to your computer. This will create a Network with just one computer. Your modem may have more ethernet ports on it, but more than likely it only has one and if you want to connect more computers to the internet you will have to buy another device which you can read about in the next section.

# Wireless and Wireless Router

This is an optional piece to this puzzle. There is a good chance that your modem is a wireless router. If your modem already has wireless capabilities(if it has an antenna then it does) then it is a Wireless Router already. If your modem does not have wireless capabilities then you will need a Wireless Router in order to have wireless.

The only difference in the following section between having a modem that is also a wireless router and having 2 separate devices(modem + wireless router) is that you have to connect the ethernet cable from the modem to the wireless router in the latter case. The wireless settings will be the same regardless as I will explain them in the most generic way I can.

### Terms

  * Wireless &#8211; Similar to how radios work except Ethernet is broadcasted instead
  * Wireless Router &#8211; Another translation device that speaks ethernet and Wireless.
  * Router &#8211; For this explanation, lets just assume it is the same thing as Wireless Router.
  * Wireless Types &#8211; a/b/g/n These just signify the different types of wireless you can have and also what speed they are
  * Encryption Types &#8211; WEP and WPA are the two main ones. They both have different sub types.
  * IP Address &#8211; Same as regular addresses except they are just a set of numbers with periods and computers use them to send messages back and forth.

### Setup

### <span class="Apple-style-span" style="font-size:13px;font-weight:normal;">Typically your router or modem will have the Ip Address of 192.168.0.1 or 192.168.1.1. When people have problems with their home network the first thing I try is opening a web browser and typing in http://192.168.0.1 and then try http://192.168.1.1 if the first one didn&#8217;t work. This is probably 99.9% of all home network router IP Addresses and will bring up the setup page for your wireless router where you can log in.</span>

What is my username and password??? I don&#8217;t know because I&#8217;m not supposed to know, BUT, maybe try the following

  * admin/password
  * admin and no password

<div>
  If those fail then you will probably have to reset your router. That is something you can figure out yourself.
</div>

<div>
  Ok, so now you are logged into your router. You need to search out and find the wireless settings. There is probably a tab named Wireless or WLAN somewhere. If not click through all the sub pages until you find something that has a select box that has WEP, WPA&#8230; in it.
</div>

<div>
  This page should have the following options(note I&#8217;m describing in general, you will have to interpret)
</div>

<div>
  <ul>
    <li>
      Wireless Network Name/SSID &#8212; This will show up when you search for wireless networks on your computer
    </li>
    <li>
      Security Type &#8212; OMG!! What do all of these mean? In due time Watson.
    </li>
    <li>
      Channels &#8212; 1 &#8211; 11 is the range usually and I think 6 is usually the default that everybody uses. Not good.
    </li>
    <li>
      Mode &#8212; A, B, G, N The type of wireless you want to offer
    </li>
  </ul>
</div>

<div>
  <a href="/wp-content/uploads/2011/10/screen-shot-2011-10-13-at-1-26-16-pm.png"><img class="alignleft size-medium wp-image-789" title="Netgear Example" src="/wp-content/uploads/2011/10/screen-shot-2011-10-13-at-1-26-16-pm.png" alt="Screen Shot" width="300" height="199" /></a>Here is an example from a Netgear Wireless Router.
</div>

### Wireless Name

Pick something other than linksys or netgear PLEASE!!! This just asks for trouble. When I see these network names pop up when I go to connect to the internet I have to fight off the urges to crac&#8230;.log into them and change settings.

I have seen some pretty offensive network names in the past as well after somebody has hopped onto an open network that was unsecured and probably named linksys or netgear. It just signifies that the network was setup by somebody that had no clue what they were doing.

Be creative with naming your network and try not to name it something that random people would know which house it comes from. Maybe something that when your friends come over they will figure out it is yours, but not a random person walking by on their iPad.

### Encryption Type

<div>
  So which security type should you choose? Don&#8217;t choose WEP as it is very easy for even a novice cracker to break into.
</div>

<div>
  I usually choose WPA2-PSK as it gives fairly good encryption and allows you to choose an easy to remember passphrase unlike some of the other options that require you to have a ridiculous 64 character key(I&#8217;m looking at you William Hosebein)
</div>

### Mode

<div>
  As I stated before the modes just dictate which types of wireless to provide.
</div>

<div>
  <ul>
    <li>
      Wireless A is pretty rare and old. I doubt you will have that
    </li>
    <li>
      B and G are probably 90%-95% of all wireless networks. B is 11Mbs and G is 54Mbs
    </li>
    <li>
      N is quite new and provides 108Mbs but most laptops do not have that capability yet, although I think all the new laptops are shipping with it.
    </li>
  </ul>
  
  <div>
    If you are unsure leave it at default or select B and G if you can.
  </div>
</div>

### Channel

Usually I select one at random as so many people use 6 that I&#8217;m weary that other networks around my house will interfere. I actually don&#8217;t know how much it matters. It is just a &#8220;thing&#8221; I worry about.

### Passphrase

Pick something fairly easy for you to remember. It doesn&#8217;t have to be some ridiculously complex passphrase.

# Conclusion

Wireless networks are really not that complicated to set up. The options are quite cryptic, but you should be able to bumble your way through them now and have a safer feeling that some random jerk isn&#8217;t going to hop on your network and do something malicious. It won&#8217;t 100% protect you from creepy-Mc-still-lives-in-his-mom&#8217;s-basement, but it will make it much less likely.

Have questions or comments feel free to respond via Facebook or in the comments below.
