---
id: 134
title: Xen to KVM the manual way
date: 2009-01-19T18:39:24+00:00
author: tyghe
layout: post
guid: http://tygertown.us/blog/?p=134
permalink: /xen-to-kvm-the-manual-way/
original_post_id:
  - 134
categories:
  - Technical Computing
tags:
  - convert
  - kvm
  - xen
---
Most of the steps are from [here](http://fraise.co.nz/node/7){.external} with a bit more detail and modifications
  
**Make a directory for the kvm disk image[s]**

<pre>mkdir /virt/&lt;hostname&gt;</pre>

**Make a qcow2 image to copy the data to**

<pre>cd /virt/&lt;hostname&gt;
qemu-img create -f qcow2 disk.qcow2 8G</pre>

_Note: make the image a similar size to that of the disk.img from the Xen image_
  
**Create a config for the new VM**

<pre>create-xml.sh &lt;hostname&gt;</pre>

**Edit the config and add the old disk image and the live cd**
  
use this page [Libvirt\_XML\_Config](http://libvirt.org/formatdomain.html) to add a live cd to the config and the Xen disk image

The final disk configs should look similar to this

<pre>&lt;disk type='file' device='cdrom'&gt;
      &lt;source file='/virt/Hardy32.iso'/&gt;
      &lt;target dev='hdc'/&gt;
    &lt;/disk&gt;
    &lt;disk type='file' device='disk'&gt;
      &lt;source file='/virt/pxe.msu.montana.edu/disk.qcow2'/&gt;
      &lt;target dev='hda'/&gt;
    &lt;/disk&gt;
    &lt;disk type='file' device='disk'&gt;
      &lt;source file='/virt/pxe.msu.montana.edu/disk.img'/&gt;
      &lt;target dev='hdb'/&gt;
    &lt;/disk&gt;
    &lt;disk type='block' device='disk'&gt;
     &lt;source dev='/dev/sda1'/&gt;
     &lt;target dev='hdd'/&gt;
    &lt;/disk&gt;</pre>

**Start the vm and connect using vnc**
  
Start the vm

<pre>virsh create /etc/libvirt/qemu/&lt;hostname&gt;</pre>

Get the vnc display number:

<pre>virsh vncdisplay &lt;hostname&gt;</pre>

On your local machine

<pre>vncviewer virtual1-acg.msu.montana.edu:&lt;display number from above&gt;</pre>

Select English and then select the Option to use the live cd
  
**Partition, mount, and copy data**
  
In the vnc vm display open a terminal

<pre>sudo su
cd /mnt
mkdir xen
mkdir kvm
mkdir grub</pre>

You need to determine which /dev is which. I just mount /dev/sdb to something and if it works thats the xen image since it has a filesystem on it and can mount. If it complains about there not being a filesystem then mount /dev/sda to verify that it is the disk.

#### Partition

Figure out which /dev is the qcow2 image and run this on it

sfdisk table

<pre># partition table of /dev/sda
unit: sectors

/dev/sda1 : start=       63, size= 13687317, Id=83
/dev/sda2 : start= 13687380, size=  3084480, Id=83
/dev/sda3 : start=        0, size=        0, Id= 0
/dev/sda4 : start=        0, size=        0, Id= 0</pre>

copy that text into a file called parts and then run

<pre>sfdisk &lt; parts
mkfs.ext3 /dev/sda1
mkswap /dev/sda2</pre>

#### Mount

<pre>mount /dev/sda1 /mnt/kvm
mount /dev/sdb /mnt/xen
mount /dev/sdc /mnt/grub</pre>

_Note: The dev names may be different for you_

#### Copy Data, Install Kernel

You will need to setup the live cd network.

  1. In the upper right there is a network icon.
  2. Left click it an go to settings/manual configuration
  3. Select the wired connection and click properties
  4. Uncheck Enable Roaming mode 
      * Configuration: Static Ip address
      * Ip Address: Ip of the vm you are transfering
      * Subnet mask: 255.255.254.0
      * Gateway address: 153.90.237.254
      * Set the DNS to 153.90.2.1
  5. Click ok
  6. Close the Network Settings box you now have network

<pre>cp -a /mnt/xen/* /mnt/kvm/
cp -a /mnt/grub/grub /mnt/kvm/boot/
chroot /mnt/kvm
apt-get update
aptitude install -r grub linux-image-&lt;kernel #&gt;-server linux-image-server linux-ubuntu-modules-2.6.22-15-server
rm /boot/grub/menu.lst
update-grub
exit</pre>

_Note: Change the to the kernel for the dist in the image(gutsy[2.6.22-15]/heron[2.6.24-16]/intrepid)_

#### Edit the vm network settings(kvm/etc/network/interfaces)

For some reason you need to use eth1 instead of eth0
  
Change

<pre>[...]
auto eth0
interface eth0 inet static
[...]</pre>

To

<pre>auto eth1
interface eth1 inet static
[...]</pre>

Gather the virtual disk UUID

<pre>udevinfo -q env -n /dev/sd[a-z]1</pre>

__Note: sd[a-z]1 is the device that you partitioned above
  
Copy the UUID

<pre>#udevinfo -q env -n /dev/sda1
[...]
ID_FS_UUID=0859e10a-04dc-4c54-ae40-26c632ac296d
[...]</pre>

Edit the /mnt/kvm/boot/grub/menu.lst
  
change all the kernel lines to reflect the UUID instead of whatever disk it is trying to use

<pre>[...]
kernel     /boot/vmlinuz-2.6.22-15-virtual root=UUID=&lt;UUID FROM ABOVE&gt; ro quiet splash
[...]</pre>

_Note: This is the point where my browser froze and I lost some stuff so there may be a few minor steps missing_

Shutdown the VM

#### Edit the xml file

  * Remove the /dev/sda1 and disk.img disk declarations
  * Change the boot device to cdrom 
    <pre>&lt;boot dev='cdrom'/&gt;</pre>

  * Boot back into the live cd

#### Install Grub

In the live cd open a terminal again

<pre>sudo su
cd /mnt
mkdir root
mount /dev/sda1 /mnt/root
mount -t proc none /mnt/root/proc
mount -o bind /dev /mnt/root/dev
chroot /mnt/root /bin/bash</pre>

Now we open a grub prompt by typing grub and then executing the following

<pre>root (hd0,0)
setup (hd0)
quit</pre>

Shutdown the vm

#### Set the newly setup disk to boot

  * Edit the xml file and remove the iso disk declaration
  * Change the boot device back to hd 
    <pre>&lt;boot dev='hd'/&gt;</pre>

  * Start the vm

#### Setup the NIC in the vm

For some reason the nic doesn’t get setup so we have to manually do it

  * Find the nic model(most likely RTL-8139)
  
    Using lspci will show you the Ethernet Controller