---
id: 696
title: Samba With Active Directory Authentication but LDAP uid/gid
date: 2011-03-17T00:02:23+00:00
author: tyghe
layout: post
guid: /blog/?p=696
permalink: /samba-with-active-directory-authentication-but-ldap-uidgid/
wordbooker_options:
  - 'a:8:{s:18:"wordbook_noncename";s:10:"d83ea1549f";s:18:"wordbook_page_post";s:4:"-100";s:18:"wordbook_orandpage";s:1:"2";s:23:"wordbook_default_author";s:1:"2";s:23:"wordbook_extract_length";s:3:"256";s:19:"wordbook_actionlink";s:3:"300";s:18:"wordbook_attribute";s:31:"Posted a new post on their blog";s:29:"wordbooker_status_update_text";s:35:": New blog post :  %title% - %link%";}'
wp-esprit-picasa-meta-description:
  - 
wp-esprit-picasa-meta-title:
  - 
wp-esprit-picasa-meta-url:
  - 
original_post_id:
  - 696
categories:
  - Technical Computing
tags:
  - 10.10
  - active
  - authentication
  - directory
  - ldap
  - maverick
  - open
  - samba
  - ubuntu
---
Everybody has specific needs and at the University that I work for we needed to provide a way for both \*nix + Windows machines to authenticate to storage and share the same uid/gid for files. If you do the typical Samba + AD setup you will end up having winbind mapping SID&#8217;s to UID&#8217;s using some &#8220;dumb&#8221; mapping techniqe which works well if you are only using windows clients. If you have \*nix clients then things get messy because you may have UID overlap beween AD and Local/LDAP, files created by an AD user and then they try to access them from a *nix machine and the UID/GID doesn&#8217;t match so they cannot get to or modify their files&#8230;.

So what we needed was to have Samba authenticate against AD but somehow have the SID&#8217;s mapped to the appropriate LDAP user&#8217;s UID. Searching around I apparently was not searching for the correct terms as I could not find anything until after I ran across this <a title="AD Auth with Samba and LDAP uid/gid" href="http://wiki.samba.org/index.php/Samba,_Active_Directory_%26_LDAP" target="_blank">http://wiki.samba.org/index.php/Samba,_Active_Directory_%26_LDAP</a> which is exactly what we were looking for.

The one thing he doesn&#8217;t mention in the article is that it assumes that the uid attribute in LDAP has an entry that matches the username entry in AD, which for our case was not always true, but our uid attribute is a multivalue attribute and we can make due if needed.

So what you will have after the installation is this

  * Samba authenticating with Active Directory
  * Samba mapping the Active Directory user to a local machine user
  * The local machine authenticating to LDAP which means Samba maps AD users to LDAP users with the same uid

## Ubuntu 10.10 Maverick Installation

### Local LDAP Authentication

  * Install

> apt-get install ldap-auth-client 

  * If you have troubles you can try this and tell the LDAP client it doesn&#8217;t need to verify the certificate

> echo &#8220;TLS_REQCERT never&#8221; >> /etc/ldap/ldap.conf 

  * /etc/ldap.conf

> \# The distinguished name of the search base.
  
> \# Whatever OU holds your users that you want to authenticate
  
> base ou=People,dc=example,dc=com
> 
> \# The uri to the ldap server
  
> \# ldaps example
  
> uri ldaps://<your ldap server goes here>/
> 
> \# The distinguished name to bind to the server with.
  
> \# Optional: default is to bind anonymously.
  
> binddn <full bind dn>
> 
> \# The credentials to bind with.
  
> \# Optional: default is no credential.
  
> bindpw <password for binddn user>
> 
> \# HEADS UP: the pam\_crypt, pam\_nds_passwd,
  
> \# and pam\_ad\_passwd options are no
  
> \# longer supported.
  
> #
  
> \# Do not hash the password at all; presume
  
> \# the directory server will do it, if
  
> \# necessary. This is the default.
  
> pam_password md5
> 
> \# OpenLDAP SSL mechanism
  
> \# start_tls mechanism uses the normal LDAP port, LDAPS typically 636
  
> \# start_tls is the new recommended way but pick whichever works for you
  
> \# JUST MAKE SURE YOU DO ONE OF THEM
  
> #ssl start_tls
  
> ssl on 

  * /etc/auth-client-config/profile.d/open_ldap

> [open_ldap]
  
> nss_passwd=passwd: files ldap
  
> nss_group=group: files ldap
  
> nss_shadow=shadow: files ldap
  
> nss_netgroup=netgroup: files ldap
  
> pam\_auth=auth required pam\_env.so
          
> auth sufficient pam_unix.so likeauth nullok
  
> #the following line (containing pam\_group.so) must be placed before pam\_ldap.so
  
> #for ldap users to be placed in local groups such as fuse, plugdev, scanner, etc &#8230;
          
> auth required pam\_group.so use\_first_pass
          
> auth sufficient pam\_ldap.so use\_first_pass
          
> auth required pam_deny.so
  
> pam\_account=account sufficient pam\_unix.so
          
> account sufficient pam_ldap.so
          
> account required pam_deny.so
  
> pam\_password=password sufficient pam\_unix.so nullok md5 shadow
          
> password sufficient pam\_ldap.so use\_first_pass
          
> password required pam_deny.so
  
> pam\_session=session required pam\_limits.so
          
> session required pam_mkhomedir.so skel=/etc/skel/
          
> session required pam_unix.so
          
> session optional pam_ldap.so 

  * Apply ldap config

> auth-client-config -a -p open_ldap 

### Setup datetime sync from AD Server

  * Update time

> ntpdate <AD time server> 

  * Tell time to update every day

> echo &#8220;ntpdate <AD time server>&#8221; > /etc/cron.daily/ntpdate; chmod 755 /etc/cron.daily/ntpdate 

### Kerberos Setup

  * Install

> apt-get install krb5-user krb5-config libkdb5-4 libgssrpc4 

  * /etc/krb5.conf

> default = FILE:/var/log/krb5libs.log
  
> kdc = FILE:/var/log/krb5kdc.log
  
> admin_server = FILE:/var/log/kadmind.log
> 
> [libdefaults]
   
> default_realm = EXAMPLE.COM
   
> dns\_lookup\_realm = false
   
> dns\_lookup\_kdc = false
   
> ticket_lifetime = 24h
   
> forwardable = yes
> 
> [realms]
      
> EXAMPLE.COM = {
          
> kdc = <your kdc server which is probably your AD server>
          
> admin_server = <probably the same as kdc server>
          
> default_domain = EXAMPLE.COM
      
> }
> 
> [domain_realm]
      
> .example.com = EXAMPLE.COM
      
> example.com = EXAMPLE.COM 

  * Get a kerberos ticket(use a user that can add machines to the domain)

> kinit <ad user>@EXAMPLE.COM 

### Setup Samba

  * <span style="font-size:13px;font-weight:normal;">Install Samba</span>

> apt-get install samba samba-client smbldap-tools samba-doc 

  * /etc/samba/smb.conf

> [global]
          
> security = ADS
          
> realm = EXAMPLE.COM
          
> workgroup = EXAMPLE
> 
> encrypt passwords = yes
          
> log level = 3
          
> log file = /var/log/samba/%U.log
          
> max log size = 50
          
> template shell = /bin/bash
> 
> server string = %h server (Samba, Ubuntu)
> 
> syslog = 0
          
> log file = /var/log/samba/log.%m
          
> max log size = 1000
          
> dns proxy = No
          
> panic action = /usr/share/samba/panic-action %d
> 
> [test]
          
> comment = Test share
          
> path = /shares/test
          
> read only = No 

  * Restart Samba

> service smbd restart 

  * Join machine to domain

> net ads join -U <ad user from kinit above in form of user@EXAMPLE.COM>
