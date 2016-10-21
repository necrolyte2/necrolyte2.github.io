---
id: 407
title: File Types, Extensions and Application Associations
date: 2009-11-20T12:52:49+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=407
permalink: /file-types-extensions-and-application-associations/
original_post_id:
  - 407
categories:
  - How To
  - Technical Computing
---
I often run into this issue with people who don&#8217;t fully understand the correlation between File Types and File Extensions. Most people just assume that because a file has the extension .doc on the end that that means it is a Word Document file. While this is sort to of true, it is not entirely true. Here is a description of the difference.

<!--more-->When you double click a file normally your OS opens an application that knows how to read the file. So for a .xls file normally Microsoft Excel would open. Now if you download a .xls file and do not have Microsoft Excel installed you will be prompted to select the appropriate application to open the file with. If you choose another application you will notice that the icon on the file changes to the icon for the new application you selected.

<div id="attachment_408" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://tygertown.us/blog/wp-content/uploads/2009/11/ExcelAssociated.png"><img class="size-medium wp-image-408" title="ExcelAssociated" src="http://tygertown.us/blog/wp-content/uploads/2009/11/ExcelAssociated-300x221.png" alt=".xls file Associated with Excel" width="300" height="221" /></a>
  
  <p class="wp-caption-text">
    .xls file Associated with Excel
  </p>
</div>

<div id="attachment_409" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://tygertown.us/blog/wp-content/uploads/2009/11/NotepadAssociated.png"><img class="size-medium wp-image-409" title="NotepadAssociated" src="http://tygertown.us/blog/wp-content/uploads/2009/11/NotepadAssociated-300x259.png" alt=".xls Associated with Notepad" width="300" height="259" /></a>
  
  <p class="wp-caption-text">
    .xls Associated with Notepad
  </p>
</div>

So in the two images above you can see how the icon changes showing which application is associated with the file extension.

So the importance of knowing this is that even though you may not have an application that is normally associated with a file extension installed, you can still open the file, although, it may show up as garbage in the program you open it with.

The reason I am posting all of this is because there are typically two common questions that I get that deal with this.

  1. How come when I installed Application X it changed all of my icons for a certain file to it&#8217;s icon and how do I change them back.
  2. How do I tell Application X to open when I double click a certain file

Well here is the solution for both of those problems

### Windows

If you are using Windows the easiest way to associate an application with a file type is to simply right click on the file and select &#8216;Open With&#8217;. Depending on which version of Windows you are using a different dialogue will pop up. Regardless though, you should see a list of applications to choose from. More than likely you will see the application that you want to open the file in this list. If not you will have to click browse and search through your hard drive to find it(Look under c:program files)

<div id="attachment_412" style="width: 310px" class="wp-caption aligncenter">
  <a href="http://tygertown.us/blog/wp-content/uploads/2009/11/OpenWith.png"><img class="size-medium wp-image-412" title="OpenWith" src="http://tygertown.us/blog/wp-content/uploads/2009/11/OpenWith-300x261.png" alt="Open With Box" width="300" height="261" /></a>
  
  <p class="wp-caption-text">
    Open With Box
  </p>
</div>

Here you can see the Open With box. Note the check box that tells Windows to Always open the selected program. Uncheck that box only if you want the application you are selecting to open that file this time only.

### Mac

The instructions are almost identical to the instructions for Windows.

Right click on the file move over Open With. You will notice it has recommended applications that you can select from or you can click &#8216;Other&#8230;&#8217; which will allow you to choose from the applications installed on your Hard Drive.

### Linux

If you are using Linux, I&#8217;m surprised you&#8217;ve read this far to be honest. I can&#8217;t actually answer this due to the fact that Linux has so many different Window Mangers.

If you are using Gnome(at least on Ubuntu 8.04) then the process is actually the same as Windows/Mac so you are in luck. If you are using something crazy then I assume you know how to do it yourself.
