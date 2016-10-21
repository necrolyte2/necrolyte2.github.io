---
id: 365
title: MySQL Ubuntu OpenSSL Support
date: 2009-10-21T10:51:51+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=365
permalink: /mysql-ubuntu-openssl-support/
original_post_id:
  - 365
categories:
  - Technical Computing
tags:
  - client
  - mysql
  - mysqldb
  - openssl
  - python
  - ubuntu
  - yassl
---
Ubuntu packages MySQL with yassl support instead of OpenSSL. These two implementations are incompatible. Recently we found this out at work as Red Hat and OpenSUSE both bundle MySQL with OpenSSL. One of our MySQL servers is running on Red Hat and we were unable to connect using the Ubuntu binary MySQL client. This of course also breaks things like the php-mysql, python-mysql and ruby-mysql libraries as they are compiled against the MySQL client on the distribution.

<!--more-->


  
Here are the steps on how to compile the MySQL client with OpenSSL support.

### Install needed utilities

> apt-get install build-essential openssl openssl-dev libncurses5 libncurses5-dev

build-essential gives you gcc and all the stuff needed to compile and make and such
  
openssl, openssl-dev gives you the openssl libraries to compile against
  
libncurses5, libncurses5-dev were recommended by one of the sites I used to compile the client

### Download Source

You will need to download the MySQL source code from <http://dev.mysql.com/downloads/mysql/5.1.html#downloads>
  
You can download the zip or tarball, doesn&#8217;t matter which. I recommend using wget to download the file

> wget http://dev.mysql.com/get/Downloads/MySQL-5.1/mysql-5.1.39.tar.gz/from/ftp://mirror.anl.gov/pub/mysql/

Unpack the file using unzip or tar xzvf. Unzip is not installed by default on Ubuntu so you may need to install it.

> apt-get install unzip

Enter the directory

> cd <mysql unpacked directory>

### Configure, make, make install

This was the single most important mistake that I made. From the instructions at http://ubuntuforums.org/showthread.php?t=708145
  
you can see the &#8211;disable-shared flag they use. I&#8217;m not entirely certain, but I believe this does not create dynamic libraries so
  
other things cannot compile against the shared libraries which you need if you are intending on also compiling things like mysql for php, python, ruby, etc.

> ./configure &#8211;prefix=/usr/local/mysql
  
> &#8211;with-mysqld-user=mysql
  
> &#8211;without-debug
  
> &#8211;enable-thread-safe-client
  
> &#8211;localstatedir=/usr/local/mysql/data
  
> &#8211;with-extra-charsets=none
  
> &#8211;enable-assembler
  
> &#8211;with-unix-socket-path=/tmp/mysql.socket
  
> &#8211;with-ssl=/usr/include/openssl
  
> &#8211;without-server

Now compile and push the files where they need to go

> make; make install;

Link the executables and libraries to the appropriate place

> ln -s /usr/local/mysql/bin/* /usr/bin/
  
> ln -s /usr/local/mysql/lib/mysql/\*.so\* /usr/lib/

## MySQL Module for Python

Now that you have the MySQL client libraries compiled with SSL you can install other modules. Since the object for me was to get MySQLdb installed with OpenSSL in Ubuntu I&#8217;m attaching the instructions for that as well

### Download the .egg

<a href="http://sourceforge.net/projects/mysql-python/files/mysql-python-test/1.2.3c1/MySQL_python-1.2.3c1-py2.6-linux-i686.egg/download" target="_blank">Python 2.6</a>

<a href="http://sourceforge.net/projects/mysql-python/files/mysql-python-test/1.2.3c1/MySQL_python-1.2.3c1-py2.5-linux-i686.egg/download" target="_blank">Python 2.5</a>

### Install Python utilities

apt-get install python-dev python-setuptools

### Install Module

easy_install <egg file>

### References

<https://help.ubuntu.com/community/MYSQL5FromSource>
  
<http://ubuntuforums.org/showthread.php?t=708145>
  
<http://riskable.com/?p=271>
  
<http://mysql-python.sourceforge.net/MySQLdb.html#mysqldb>
  
<http://www.kitebird.com/articles/pydbapi.html#TOC_1>
