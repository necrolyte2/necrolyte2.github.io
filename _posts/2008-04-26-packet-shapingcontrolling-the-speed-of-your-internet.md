---
id: 23
title: Packet Shaping(Controlling the speed of your internet)
date: 2008-04-26T11:38:28+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=23
permalink: /packet-shapingcontrolling-the-speed-of-your-internet/
original_post_id:
  - 23
categories:
  - Technical Computing
---
We needed to give each person in the apartment equal opportunity to the internet so

INTDEV=&#8221;eth1&#8243;
  
EXTDEV=&#8221;eth0&#8243;

\# Mark Tyghe&#8217;s Traffic
  
/sbin/iptables -t mangle -A FORWARD -s tyghe -j MARK &#8211;set-mark 50
  
/sbin/iptables -t mangle -A POSTROUTING -s ! 192.168.0.0/24 -d tyghe -j MARK &#8211;set-mark 51

\# Mark Josh&#8217;s Traffic
  
/sbin/iptables -t mangle -A FORWARD -s josh -j MARK &#8211;set-mark 60
  
/sbin/iptables -t mangle -A POSTROUTING -s ! 192.168.0.0/24 -d tyghe -j MARK &#8211;set-mark 61

\# Mark Nate&#8217;s Traffic
  
/sbin/iptables -t mangle -A FORWARD -s nate -j MARK &#8211;set-mark 70
  
/sbin/iptables -t mangle -A POSTROUTING -s ! 192.168.0.0/24 -d tyghe -j MARK &#8211;set-mark 71

\# Speeds 7000kbit / 896kbit
  
\# 2333kbit per person down
  
\# 298kbit per person up

SPLITUPSPEED=&#8221;298kbit&#8221;
  
SPLITDOWNSPEED=&#8221;2333kbit&#8221;

\# First off, we clean existing down- and uplink qdiscs and hide whatever errors there might be
  
tc qdisc del dev $INTDEV root 2> /dev/null > /dev/null
  
tc qdisc del dev $EXTDEV root 2> /dev/null > /dev/null

\# Then we make root discs for both interfaces ($INTDEV/$EXTDEV)
  
\#### This is upload
  
tc qdisc add dev $EXTDEV root handle 1: htb default 16
  
\#### This is download
  
tc qdisc add dev $INTDEV root handle 1: htb default 16

\# Now we make some classes, where we define the speeds we want to use in this example
  
\# Uploads first

\# This is for the local network speed
  
tc class add dev $EXTDEV parent 1: classid 1:1 htb rate 100mbit ceil 100mbit

\# This is for the client speeds(Set all to 289kbit)
  
tc class add dev $EXTDEV parent 1:1 classid 1:10 htb rate $SPLITUPSPEED ceil $SPLITUPSPEED
  
tc class add dev $EXTDEV parent 1:1 classid 1:11 htb rate $SPLITUPSPEED ceil $SPLITUPSPEED
  
tc class add dev $EXTDEV parent 1:1 classid 1:12 htb rate $SPLITUPSPEED ceil $SPLITUPSPEED

\# Downloads

\# Again for the local network
  
tc class add dev $INTDEV parent 1: classid 1:1 htb rate 100mbit ceil 100mbit

\# Clients download speeds(Set all to 2333kbit)
  
tc class add dev $INTDEV parent 1:1 classid 1:10 htb rate $SPLITDOWNSPEED ceil $SPLITDOWNSPEED
  
tc class add dev $INTDEV parent 1:1 classid 1:11 htb rate $SPLITDOWNSPEED ceil $SPLITDOWNSPEED
  
tc class add dev $INTDEV parent 1:1 classid 1:12 htb rate $SPLITDOWNSPEED ceil $SPLITDOWNSPEED

\# Now we want to filter the traffic and send it to the correct classid
  
\# These are download speeds for PC1 and PC2

\# We set the rule so that pc&#8217;s only are only able to download with 233KBit
  
tc filter add dev $INTDEV parent 1:0 protocol ip prio 7 handle 51 fw classid 1:10
  
tc filter add dev $INTDEV parent 1:0 protocol ip prio 7 handle 61 fw classid 1:11
  
tc filter add dev $INTDEV parent 1:0 protocol ip prio 7 handle 71 fw classid 1:12

\# Now we cap the upload speed at 298 Kbit
  
tc filter add dev $EXTDEV parent 1:0 protocol ip prio 7 handle 50 fw classid 1:10
  
tc filter add dev $EXTDEV parent 1:0 protocol ip prio 7 handle 60 fw classid 1:11
  
tc filter add dev $EXTDEV parent 1:0 protocol ip prio 7 handle 70 fw classid 1:12

\# We finish off by completing the qdiscs
  
tc qdisc add dev $INTDEV parent 1:10 handle 10: sfq perturb 10
  
tc qdisc add dev $INTDEV parent 1:11 handle 11: sfq perturb 10
  
tc qdisc add dev $INTDEV parent 1:12 handle 12: sfq perturb 10

tc qdisc add dev $EXTDEV parent 1:10 handle 10: sfq perturb 10
  
tc qdisc add dev $EXTDEV parent 1:11 handle 11: sfq perturb 10
  
tc qdisc add dev $EXTDEV parent 1:12 handle 12: sfq perturb 10

and saved it as /usr/bin/packetshaper.sh

edited /etc/init.d/firewall and added

/usr/bin/packetshaper.sh near the end