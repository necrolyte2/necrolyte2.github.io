---
id: 270
title: Implement Gravatar for your theme
date: 2009-08-24T14:56:12+00:00
author: tyghe
layout: post
guid: /blog/?p=270
permalink: /implement-gravatar-for-your-theme/
original_post_id:
  - 270
categories:
  - Technical Computing
---
If your theme supports the get\_header\_image or header_image function in wordpress you can modify it so that it uses a Gravatar instead.

Edit the wp-includes/theme.php file and find the function get\_header\_image and change it so it looks like this

> /**
  
> * Retrieve header image for custom header.
  
> *
  
> * @since 2.1.0
  
> * @uses HEADER_IMAGE
  
> *
  
> * @return string
  
> */
  
> function get\_header\_image( $gravatar = False ) {
  
> if( !$gravatar )
  
> {
  
> return get\_theme\_mod(&#8216;header\_image&#8217;, HEADER\_IMAGE);
  
> }
  
> else
  
> {
  
> $email = &#8221;;
  
> $tm = mktime();
  
> return &#8220;&#8216;http://www.gravatar.com/avatar.php?gravatar_id=&#8221;. md5( strtolower(&#8216;$email&#8221; ) ) .&#8221;&size=110?antiCache=$tm'&#8221; ;
  
> }
  
> }

Then modify the header_image function so it looks like this

> /**
  
> * Display header image path.
  
> *
  
> * @since 2.1.0
  
> */
  
> function header_image( $gravatar = False ) {
  
> echo get\_header\_image( $gravatar );
  
> }

Now all you have to do is find in your theme where it uses the header\_image function or get\_header_image and change it so that it just says

header\_image( True ) or get\_header_image( True ) depending on which one you use(they both do the same, one is just depricated

The image in the upper right is my gravatar
