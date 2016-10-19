---
id: 938
title: Advanced Text Search and Replace using Python
date: 2013-01-08T21:19:46+00:00
author: tyghe
layout: post
guid: http://tygertown.us/?p=938
permalink: /advanced-text-search-and-replace-using-python/
al2fb_facebook_link_time:
  - 2013-01-09T03:19:52+00:00
al2fb_facebook_link_id:
  - 43800887_878963308759
al2fb_facebook_link_picture:
  - 'avatar=https://secure.gravatar.com/avatar/22d9af95578240400eaaefc90157ded9?s=96&amp;d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96&amp;r=G'
original_post_id:
  - 938
categories:
  - How To
tags:
  - bioinformatics
  - match
  - python
  - re
  - regular expressions
  - search
---
The [last post](http://tygertown.us/2013/01/introduction-to-python/ "Introduction to Python") was just a short introduction to using Python aimed at Bioinfomaticians. In this post we are going to cover one of the most useful topics dealing with any text processing. Perl&#8217;s the &#8220;goto&#8221; scripting language for this, but frankly, I hate Perl because of its very unreadable syntax. Python supports all of the nifty features of extended regular expressions too so lets give it a go.

<!--more-->

## Module Contents

Alright, first off lets head over to the python docs for the <a title="Python Regular Expression Module" href="http://docs.python.org/2/library/re.html" target="_blank">regular expression module</a>. The module name is re.

What you are interested in is the first bit about all the special characters. These are your friends. They are how you create matching groups, how to use predefined character groups and other great things. Doesn&#8217;t make sense yet right? No problem, lets scroll down a bit more and view the Module Contents. Here you can read through the main methods that you can use to do matching and such.

I&#8217;ll narrow it down for you for now by just saying only use re.match and re.search for now. Later on when you get more cozy with regular expressions you can try some of the other stuff.

The next thing you need to know about re.match and re.search is the difference between them. Don&#8217;t forget this!! re.match matches beginning from the beginning of the text where re.search matches anywhere in the text.

Read a better description for this <a title="Python Regular Expression Searching vs Matching" href="http://docs.python.org/2/library/re.html#search-vs-match" target="_blank">here</a>.

Alright, so moving forward with the post we know that we can either match starting with the beginning of the text or anywhere in the text. Why have two methods that seem to do the same? Because they can! Don&#8217;t worry about it.

I&#8217;ll probably just stick to search only for this post.

## Match Objects

Before we can get to the good stuff of searching, we need to know that any time you do a search or match it will either return a Match object or None. If it returns None then it means that your regular expression pattern did not match anything. That is frustrating and I&#8217;ll give you some tips on how to get by that later.

If it doesn&#8217;t return None, then it returns a match object that represents the stuff that was matched.

<http://docs.python.org/2/library/re.html#match-objects>

The things we are interested from match objects are group, groups and groupdict. We will detail how to use these once we are on the road of matching in the next section.

Just know this about each.

  * group returns all the text that was matched
  * groups returns a tuple/list of the grouped texts that was matched
  * groupdict returns a dictionary of the named grouped texts that was matched

## Our First Search

Alright, first things first. Before you can use the regular expression module you need to import it. In order to import it you just simply use

> <pre>&gt;&gt;&gt; import re</pre>

Ok, now we are set to start the fun. We will start small and build big.

> <pre>&gt;&gt;&gt; m = re.search( 'ponies are', 'pretty pink ponies are cute' )
&gt;&gt;&gt; m.group()
'ponies are'
&gt;&gt;&gt; m.groups()
()
&gt;&gt;&gt; m.groupdict()
{}</pre>

Notice that it searched through the text and found &#8216;ponies are&#8217; which is what we were searching for. groups() and groupdict() both were empty because we didn&#8217;t group any text. Now, lets just try a group for fun.

> <pre>&gt;&gt;&gt; m = re.search( 'pretty (pink) ponies (are) cute', 'pretty pink ponies are cute' )
&gt;&gt;&gt; m.group()
'pretty pink ponies are cute'
&gt;&gt;&gt; m.groups()
('pink', 'cute')
&gt;&gt;&gt; m.groupdict()
{}</pre>

Ok, now we are having some fun right? Notice that group() again returned all the text that was matched. groups() now returned the text that was grouped though. groupdict() was blank again because we have not defined a named group&#8230;that is next

> <pre>&gt;&gt;&gt; m = re.search( 'pretty (?P&lt;matchone&gt;pink) ponies (?P&lt;whatever&gt;are) cute', 'pretty pink ponies are cute' )
&gt;&gt;&gt; m.group()
'pretty pink ponies are cute'
&gt;&gt;&gt; m.groups()
('pink', 'cute')
&gt;&gt;&gt; m.groupdict()
{'matchone': 'pink', 'whatever': 'are'}</pre>

Alright, there you go, you have the basics of regular expressions in Python.

## Little more advanced. Search a file

Sticking with the bioinformatics theme, lets pretend we have a fasta file(text file representing some DNA sequence). Copy and paste this text into a file called myfasta.fna

> <pre>&gt;sequencename1 length=10 isitbacon=False
ATGCAAGGCA
&gt;sequencename2 lengthyturkey=12 isitbacon1234=True
ATGCCCCCAAGG</pre>

Ok, so we have our fake file to play with. More than likely the file would only have length= for both lines and isitbacon=. Haha, well welcome to Science!!! Never know for sure what you are going to get. REGULAR EXPRESSIONS TO THE RESCUE!!

Really, who cares what the text in the file is we just want to do some useful searching and maybe replacing. While in the same directory as the file you just created, fire up the python interpreter

> <pre>&gt;&gt;&gt; # Start by importing the module
&gt;&gt;&gt; import re
&gt;&gt;&gt; # Lets read in our fasta file so we can play with it
&gt;&gt;&gt; for line in open( 'myfasta.fna' ):
...     m = re.search( 'lengthw*=(w+)', line )
...     # Need to ensure there is a match object returned
...     if m:
...         m.groups()
('10',)
('12',)</pre>

Let&#8217;s ingest this.

So we are looping through each line in the file. Assigning the variable _line _the value of each line. Then we are performing a regular expression search on that line.

Breaking down the regular expression

Match the the word length followed by zero or more Letter, digit or underscore followed by an equal sign followed by a group one or more letter, digit or underscore.

The if statement is needed as the regular expression will not match the lines that do not match(aka the sequence lines not beginning with a >)

## Where to go from here

  * <p style="display:inline !important;">
      <a title="Regular Expression Testing" href="http://www.regexplanet.com/" target="_blank">This Site</a> &#8211; Here you can try regular expressions using any of the main scripting languages. Very useful to test your regular expressions.
    </p>

  * Build your regular expressions from the left to the right a little at a time. If you build a huge one and then try it out get ready for a painful experience.
  * Be prepared to be confused! It happens, don&#8217;t worry. Save your current expression somewhere else and then start reducing it in size until it matches. Then build it back up from there.
  * Don&#8217;t forget to check to make sure your expression matched. That is, don&#8217;t do this unless you are so sure it will match that you are willing to put it into space shuttle code.

> <pre>&gt;&gt;&gt; import re
&gt;&gt;&gt; mymatches = re.match( 'some pattern', 'some text' ).groups()</pre>

  * Named groups are great. I love dictionaries.
  * Get a good grasp of the items under this <a title="Regular Expression Syntax" href="http://docs.python.org/2/library/re.html#regular-expression-syntax" target="_blank">link</a>
  * Learn what the re.MULTILINE and re.DOTALL do
  * Be very careful with .\* it will bite you. Just know that .\*? is out there to help you