---
id: 1138
title: How many commands can you memorize
date: 2014-04-11T09:09:21+00:00
author: tyghe
layout: post
guid: /?p=1138
permalink: /how-many-commands-can-you-memorize/
categories:
  - Friday Linux
  - How To
tags:
  - bash
  - commands
  - learning
  - linux
---
[Friday Linux](/category/friday-linux/http:// "Friday Linux Category") is something I started doing at work for people to get used to the shell environment. I started writing these on our wiki at work, but decided to move them to the web since they are general enough. I will post up the other ones I have done later, but for now, here is today&#8217;s Friday Linux

This topic is to simply get you acquainted with what commands are available in the bash shell so you know what is available
  
Just a simple list more or less

Just remember this is just a list to get acquainted. You should investigate the ones that look interesting to you by experimentation and also using the man pages.

## The List

  * ls 
      * List permissions, size and what not of file. If you select detail view in Windows explorer you would get something similar(but ls has much more goodies too)

  * cd 
      * Change directory. cd /path/to/something
  * rm 
      * Remove command. rm -rf is the command that removes directories and files inside of those directories
  * ps 
      * Process list. Typically use ps -ef to show all processes
  * grep 
      * Search for text inside files or text streams
  * sed 
      * Replace text inside of files or text streams
  * cat 
      * concatenate files
  * echo 
      * Print some text
  * touch 
      * set access/modify timestamp on a file, but really useful to just create an empty file
  * awk 
      * scripting language processor, but usually used to do things on text that is delimiter separated
  * xargs 
      * Operates on line by line input and runs a command on each line&#8230;more or less
  * pushd and popd 
      * Creates a stack of directories as you visit them so it is easy to go back to where you came from.

> <pre>cd /; pushd /some/path; echo "Now I am in /some/path"; popd; echo "Now I am back in /";</pre>

  * chmod 
      * Change permissions on file/directory
  * chown 
      * Change ownership on file/directory
  * tar 
      * Make archive. Like winzip, but better of course
  * ln 
      * Create a hard or soft link(think shortcuts, but what is the difference between soft and hard links? Google away my friend)
  * mkdir 
      * Create directory(mkdir -p is your friend)
  * ping 
      * Check to see if another computer is alive
  * head & tail 
      * Beginning and end of a file or text stream(try head -5 or tail -38. You can use any number for those commands after the dash to show that many lines)
  * rsync 
      * The best copy command that exists in computing. No joke! Rsync not only copies files, but it essentially remembers exactly where it left off if it stops mid way through copying. I almost always use rsync instead of the cp command because rsync also has the &#8211;progress option which gives you status of how much is copied where cp is a pain to get get info like that.
  * find 
      * Find files and/or directories. Many many confusing options, but find is amazing once you invest the time to figure it out

> <pre>find /root/path/to/search -name "*.txt"</pre>

  * kill 
      * Kill process. Probably use ps -ef | grep &#8216;program&#8217; to get the pid field then use kill to kill it(or kill -9 to really really kill it with a knife and gun)
  * screen(usually requires being installed specially) 
      * Don&#8217;t ssh and do analysis without learning screen or an equivalent. Screen essentially protects you from network outages
  * tee 
      * Hard to explain if you don&#8217;t understand pipes, but tee allows you to output to the screen and also into a pipe at the same time
  * diff 
      * Show difference between two text files
  * sort and uniq

> <pre>echo -e '5\n7\n9\n3\n1\n6\n5\n9' | sort | uniq -c
1 1
1 3
2 5
1 6
1 7
2 9</pre>

  * wget 
      * Download a file from the web
  * curl 
      * Fetch anything from the web(ftp,http,https&#8230;) It is awesome. Try it out.

I&#8217;m just going to stop there. There are plenty more, but hopefully you are excited enough to explore and find some more that you can use. Sorry they are not in alphabetical order, just kind of dumped the list as I thought of them

Tyghe&#8217;s Favorite List:
  
vim
  
If this excites you that I use VIM, that is awesome
  
If you are angered that I am not using emacs, that is awesome
  
Else figure out how to be excited or angered and fit into one of the above 2 groups

  1. rsync
  2. curl
  3. grep
  4. awk
  5. sed

Just remember, for the most part, any command that outputs can be piped into another command and so on. This gives you the power to do anything you can dream up.
