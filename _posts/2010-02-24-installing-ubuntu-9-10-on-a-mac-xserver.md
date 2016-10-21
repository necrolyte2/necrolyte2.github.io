---
id: 458
title: Installing Ubuntu 9.10 on a Mac Xserver
date: 2010-02-24T20:16:16+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=458
permalink: /installing-ubuntu-9-10-on-a-mac-xserver/
original_post_id:
  - 458
categories:
  - How To
  - Technical Computing
tags:
  - 1
  - apple
  - grub
  - install
  - intel
  - karmic
  - mac
  - server
  - ubuntu
  - xserver
---
## References Used

  * Use this link to install. <http://blog.christophersmart.com/2009/07/23/linux-on-an-apple-xserve-efi-only-machine/>
  * Use this link to configure grub. <https://help.ubuntu.com/community/Xserve1-1>

<!--more-->

## Instructions

  1. Plug in a generic usb drive that is at least 100Mb in size to your linux machine
  2. Make sure to unmount the drive if it automounts
  3. Partition and setup the usb disk 
      * <pre>parted -s /dev/sdz mklabel gpt mkpartfs EFI fat32 0% 100% toggle 1 boot</pre>
    
      * Download [this](http://christophersmart.com/files/efi-grub.tar.bz2 "EFI Files") file from Christopher Smart&#8217;s blog. You can also check out Christopher Smart&#8217;s blog for updates to this file. I attached it here in case his version goes away at some time. Basically the file is just a compressed set of files that you can make yourself if you want to try. You will need to compile grub for EFI which is not that hard. The hardest part is getting the init/kernel images for your distribution which are included in this file. I&#8217;m pretty sure that for Ubuntu you can get these files off of the install cd in one of the directories.
      * Mount the usb disk and extract the tar.bz file onto it. You should end up with an efi folder with a boot folder inside of it containing all the stuff needed for the disk to boot on the mac.
  4. Unmount and eject the usb drive and go plug it into your mac server
  5. Make sure you also have an apple keyboard attached to the server. Other keyboards may or may not work.
  6. Reboot the server and hold down the Option key on the mac keyboard. You can try to hold down the alt key on a PC type keyboard and that MAY work, but don&#8217;t count on it.
  7. Hold the option key down until the EFI menu comes up and select EFI as the boot device
  8. Once the grub menu comes up select Ubuntu Karmic. These servers will only do 32bit so you cannot select the 64bit Karmic installer
  9. Installation 
      * I&#8217;m not going to go through the entire process just give some ideas of how I setup things when I did the installs
      * Choosing a mirror 
          * Once you are in the list of mirrors hit the Home key which will take you to the top of the page where you can input your own mirror
      * Partitioner 
          * Once you get to the partitioner you will have to make sure that you create a FAT32 partition at the beginning of one of the drives. I usually pick the first one in the list to do this to, but I don&#8217;t think it matters. You will have to put the same stuff that is on the USB drive in this partition at the end of the install
          * The rest of the partition scheme is up to you as it is the same as any normal install
      * Base System 
          * The kernel I know works for sure is the generic one. I&#8217;m sure others will work, but this is the only tested version
          * I also select include all drivers as well just to be sure
      * Setup users and passwords 
          * Enable Shadow Passwords
          * Do not enable root to log in
      * Package Manager 
          * Enable everything but backports(you will only have to select a different option than the default for partner repositories)
      * Select and install software 
          * Select the following 
              * Basic Ubuntu Server
              * OpenSSH Server
      * Install Grub 
          * Install Grub 2 
              * Select to install to the <acronym title="this should fail, but I think this at least gets the grub package installed which you will want">MBR</acronym>
              * When it fails select continue 2x
              * Select continue without a bot loader and then select continue
      * Setup the EFI partition 
          * Execute a Shell 
              1. Make the mount points 
                  * <pre>mkdir /mnt/usb /mnt/efi</pre>
                    
                      1. Mount the usb drive and the efi partition 
                          * <pre>mount /dev/sda1 /mnt/usb</pre>
                        
                          * <pre>mount /dev/sdb1 /mnt/efi</pre>
                    
                      2. Copy the usb efi directory to the efi partition 
                          * <pre>cp -r /mnt/usb/efi /mnt/efi</pre>
                    
                      3. Setup grub.cfg for your installation 
                          * <pre>set timeout=10
set default=0
menuentry "Ubuntu 9.10 32bit" {
   fakebios
   root=hdX,Y
   linux /vmlinuz  root=/dev/sdaX video=efifb
   initrd /initrd.img
}
menuentry "Ubuntu Karmic 32bit Installer" {
   linux /efi/boot/linux-karmic priority=low vga=normal video=efifb
   initrd /efi/boot/initrd-karmic.gz
}</pre>
                        
                          * You will need to change the root=hdX,Y to be the location of your boot partition for the installation
                          * You will need to change the root=/dev/sdaX line to point to the same boot partition as the other root= line
          * Exit the shell by typing exit and pressing enter
      * Select Finish the installation
      * Set the clock to UTC
      * Disconnect the usb drive when the Installation Complete box comes up and select continue
 10. Your mac should now boot into the grub install off of the hard disk
