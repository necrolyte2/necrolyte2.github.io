---
id: 683
title: Install Staden on Ubuntu Mavrick
date: 2011-03-09T00:24:28+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=683
permalink: /install-staden-on-ubuntu-mavrick/
wordbooker_options:
  - 'a:8:{s:18:"wordbook_noncename";s:10:"322b78466c";s:18:"wordbook_page_post";s:4:"-100";s:18:"wordbook_orandpage";s:1:"2";s:23:"wordbook_default_author";s:1:"2";s:23:"wordbook_extract_length";s:3:"256";s:19:"wordbook_actionlink";s:3:"300";s:18:"wordbook_attribute";s:31:"Posted a new post on their blog";s:29:"wordbooker_status_update_text";s:35:": New blog post :  %title% - %link%";}'
wp-esprit-picasa-meta-description:
  - 
wp-esprit-picasa-meta-title:
  - 
wp-esprit-picasa-meta-url:
  - 
original_post_id:
  - 683
categories:
  - Technical Computing
tags:
  - build
  - compile
  - install
  - io_lib
  - make
  - mavrick
  - staden
  - ubuntu
---
Few things to note before we begin.

  * This guide assumes you are using Ubuntu 10.04 LTS Maverick. It may work under other versions, but only tested in 10.04
  * The versions of staden and io_lib that were used are
  * <a title="Staden 2.0.0b9" href="http://sourceforge.net/projects/staden/files/staden/2.0.0b9/staden-2.0.0b9-src.tar.gz/download" target="_blank">staden-2.0.0b9</a>
  * <a title="io_lib 1.12.5" href="http://sourceforge.net/projects/staden/files/io_lib/1.12.5/io_lib-1.12.5.tar.gz/download" target="_blank">io_lib-1.12.5</a>

1. Easiest thing to do is create a folder in your home directory called staden and do everything inside there

> mkdir ~/staden

> cd ~/staden

2. Download both staden and the staden-iolib packages from [here](http://sourceforge.net/projects/staden/files/ "Staden Download"). I use wget but you can do it however you want. Just make sure to save them to ~/staden

3. Upack the two files. You should have one that is something like staden-2.0.0b7-src.tar.gz and the other is io_lib-1.12.5.tar.gz

> for file in \`ls *.gz\`; do tar xzvf $file; done;

4. Now we need to setup your system so it has the prerequisites for compiling as well as for staden

> sudo apt-get install tclx8.4 tclx8.4-dev tk8.4 tk8.4-dev zlib1g-dev liblzma-dev libpng12-dev tklib itcl3 itcl3-dev iwidgets4 itk3 itk3-dev build-essential libcdk5-dev libcurl4-gnutls-dev
> 
> sudo ln -s /usr/bin/make /usr/bin/gmake

5. Configure, Make and install the io_lib package

> cd io_lib-1.12.5
> 
> ./configure
> 
> make && sudo make install

6. Configure, Make and install staden

> cd ../
> 
> cd staden-2.0.0bd-src
> 
> mkdir build.mavrick
> 
> cd build.mavrick
> 
> ../configure
> 
> make && sudo make install

That is is. The staden package should now be installed.

One thing to note is that if you need samtools you will need to configure, build and make it prior to step 6 above

> <div id="_mcePaste">
>   [1] Samtools is only needed by tg_index to build Gap5 databases from bam format files. Note that if used it must be built as a relocatable library by adding -fPIC to the CFLAGS in the samtools Makefile.
> </div>
