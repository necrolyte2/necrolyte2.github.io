---
id: 18
title: Now that the router is all set to go lets play
date: 2008-04-20T20:05:36+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=18
permalink: /now-that-the-router-is-all-set-to-go-lets-play/
original_post_id:
  - 18
categories:
  - Technical Computing
---
So what game should we play&#8230;well lets not get to far ahead of our selves. First we must set up the field

apt-get install apache2
  
apt-get install squid

edit /etc/apache2/sites-available/default
  
change /var/www/apache2-default to /var/www/html
  
close the file

mkdir /var/www/html
  
chown -R www-data:www-data /var/www/html
  
rm -rf /var/www/apache2-default
  
/etc/init.d/apache2 restart

Now you have a webserver running. Put documents in the /var/www/html folder for them to show up

edit /etc/squid/squid.conf
  
find http_port 3128
  
and replace it with
  
http_port <routeripaddress>:3128 transparent

find acl all src
  
add on the line above it
  
acl lan src /24 where is the broadcast. If your router ip is 123.1.1.1 then probably put 123.1.1.0

find http_access allow
  
add on the line above it
  
http_access allow lan

close the file
  
/etc/init.d/squid start

if it complains about some hostname thing
  
edit /etc/squid/squid.conf
  
find visible_hostname
  
down below that below the line #Default:
  
add visible_hostname

/etc/init.d/squid restart

iptables -t nat -A PREROUTING -i eth1 -p tcp &#8211;dport 80 -j DNAT &#8211;to 192.168.1.1:3128
  
iptables -t nat -A PREROUTING -i eth0 -p tcp &#8211;dport 80 -j REDIRECT &#8211;to-port 3128

Don&#8217;t forget to change the eth1 and eth0 to the respected external and internal device. In this example eth1 is the internal and eth0 is the external.
  
Also you will need to change 192.168.1.1 to your router&#8217;s internal ip address

Sweet, now your router is a proxy server so it caches all internet traffic without anybody having to do anything on their computer.

Why did we install the web server?
  
_Well web servers are fun and you can setup web pages and have people&#8217;s web traffic directed to them no matter where they try to go. In case maybe somebody forgot to pay rent or something you could have a page on your web server that says &#8220;You need to pay rent&#8221; and they can&#8217;t get to the internet only to that page until they pay rent_

echo &#8220;You need to pay rent&#8221; > /var/www/html/index.html
  
iptables -t nat -I PREROUTING -s 192.168.1.x -i eth1 -p tcp &#8211;dport 80 -j DNAT &#8211;to 192.168.1.1:80

Today&#8217;s play time is over, but I&#8217;ll be back out soon to play with my sweet command line based image editing + squidcache toys later.
