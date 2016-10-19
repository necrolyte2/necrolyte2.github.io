---
id: 25
title: Just a quick note about the pay rent thing
date: 2008-04-28T20:50:22+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=25
permalink: /just-a-quick-note-about-the-pay-rent-thing/
original_post_id:
  - 25
categories:
  - Technical Computing
---
http://tygertown.us/blog/?p=18

In this post near the end I mentioned something about redirecting all web redirects to a the installed web server.

You should make a slight modification to the apache config to capture all requests correctly
  
Near the top below the part add
          
RewriteEngine on
          
RewriteCond %{REQUEST_METHOD} ^(TRACE|TRACK)
          
RewriteRule .* &#8211; [F]

RewriteCond %{REQUEST_URI} !^/index.html$
          
RewriteCond %{REQUEST_URI} !^/index.php$
          
RewriteCond %{REQUEST_URI} !^/bandwidth/.*$
          
RewriteCond %{REQUEST_URI} !^/bandwidth$
          
RewriteRule ^/(.*)$ http://192.168.1.1/index.html

then
  
cd /etc/apache2/mods-enabled
  
ln -s ../mods-available/rewrite.load .