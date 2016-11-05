---
id: 927
title: Introduction to Python
date: 2013-01-05T13:44:06+00:00
author: tyghe
layout: post
guid: /?p=927
permalink: /introduction-to-python/
al2fb_facebook_link_id:
  - 43800887_877729426469
al2fb_facebook_link_time:
  - 2013-01-05T19:44:12+00:00
al2fb_facebook_link_picture:
  - 'avatar=https://secure.gravatar.com/avatar/22d9af95578240400eaaefc90157ded9?s=96&amp;d=https%3A%2F%2Fsecure.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D96&amp;r=G'
original_post_id:
  - 927
categories:
  - How To
  - Technical Computing
tags:
  - bioinformatics
  - next generation sequencing
  - ngs
  - programming
  - python
---
# Who this is for

Anybody that is brand new or just beginning into the world of Bioinformatics and wants to remove those super tedious things you do over and over or maybe just somebody new to Python.

### Why should you care about Python, you are a biologist?

Since the start of Next Generation Sequencing, biology has entered the realm of big data science. That is, huge files of data are being generated to study biology. Think of the problem like this, huge files filled with lines of text that need to be processed into something useful that tells you something. This either requires you to manually open the file and sift through the files looking for things(and probably making mistakes) or you can spend up font time and write a small python script to do it for you.

Spend X amount of time now to save X*Y amount of time later.

<!--more-->

# Install Python

If you have Windows then go <a title="Windows Python Installer" href="http://python.org/ftp/python/2.7.3/python-2.7.3.amd64.msi" target="_blank">download</a> python and install it.

If you have Linux or Mac then you already have Python!

I know this will probably upset some, but it is probably best not to use Windows for programming(Not true in all cases, but for Bioinformatics, using Linux or Mac has many advantages)

For this post I will just focus on the interpreter though to get you used to simple Python expressions

# Quick familiarization with the Interpreter

## How do you open the interpreter?

### Linux/Mac

Open a terminal and type python and press enter

### Windows

Start -> Programs ->Python -> Python (command line)

## What the heck is an interpreter?

Think of it as a translator. It translates text you type into 1&#8217;s and 0&#8217;s that the computer can understand. Very similar to spoken language translator.

## Your first Python Instruction

Open the python interpreter.

For the rest of this post any time you see >>> assume it is a python interpreter command

So lets just do a simple command

> <pre>&gt;&gt;&gt; print "Hello World"</pre>

This should then print Hello World to the screen just below that command

You are now all setup to start exploring

# The super quick tutorial. a.k.a The basics

### Types and Variables

Variables are simply something that holds a value. Types are simply what type of value is being held. Thus, every variable has a type.

> <pre>&gt;&gt;&gt; a = 5 # a is the name of the variable and is of type integer
&gt;&gt;&gt; b = 5.0 # b is of the type float
&gt;&gt;&gt; c = "5" # c is of the type string(Text)
&gt;&gt;&gt; d = True # d is of the type boolean and has the value True
&gt;&gt;&gt; def testfunction():
&gt;&gt;&gt;     print "Hello"
&gt;&gt;&gt; e = testfunction # e is of type function and has the value of the testfunction reference.</pre>

Don&#8217;t worry about that last bit too much, I&#8217;m just trying to show you that no matter what, every variable has a type and value

I leave it to you to read up on all the built in types and what type of data they hold. You have to get a good feeling for how variables and types work before you can really progress in any programming language. Just know that there are only a few basic types in any language.

  * <span style="line-height:13px;">Integer &#8211; Holds non decimal numbers</span>
  * Float &#8211; (Also called Double in some languages) Holds a decimal number
  * Boolean &#8211; True or False only!
  * Character &#8211; A single text letter
  * String &#8211; Composed of a list of characters

All the built in <a title="Python Types" href="http://docs.python.org/2/library/stdtypes.html" target="_blank">Python Types</a>

### Use a module

> <pre>&gt;&gt;&gt; import &lt;module&gt;</pre>

Usage of modules varies and can be frustrating to figure out how to use them. All I can say is try to read the documentation for that module.

### Write a function

> <pre>&gt;&gt;&gt; def functionname( parameter1, parameter2 ):
&gt;&gt;&gt;         python code that belongs to the function
&gt;&gt;&gt;         more code that is indented belongs to the function</pre>

### Conditional Statements

> <pre>&gt;&gt;&gt; x = 5 &gt; 3
&gt;&gt;&gt; if x:
&gt;&gt;&gt;     print "5 is greater than 3"
&gt;&gt;&gt; else:
&gt;&gt;&gt;     print "You won't get here unless x is True"</pre>

### Loops

While Loop(Think of it as an if statement that happens over and over). Use a while loop if you are unsure how many times you will want to loop. The value of x, in the example below, could have easily came from user input.

> <pre>&gt;&gt;&gt; x = 0
&gt;&gt;&gt; while x &lt; 10:
&gt;&gt;&gt;     print x
&gt;&gt;&gt;     x = x + 1</pre>

For Loop(Think of it as a fixed amount of loops)

> <pre>&gt;&gt;&gt; for x in range( 0, 10 ):
&gt;&gt;&gt;     print x</pre>

# The Example. Print all fasta identifier lines

> <pre>&gt;&gt;&gt; fh = open( 'myfastafile.fasta' )
&gt;&gt;&gt; for lineinfile in fh:
&gt;&gt;&gt;     if lineinfile.startswith( '&gt;' ):
&gt;&gt;&gt;         print lineinfile
&gt;&gt;&gt; fh.close()</pre>

### I have no idea where each of those commands came from or how to understand them

Good! You are not an android.

This is a perfect exercise for you to learn how to look stuff up.

open command &#8211; <a title="Python Open Command" href="http://docs.python.org/2/library/functions.html#open" target="_blank">http://docs.python.org/2/library/functions.html#open</a>

file handle(fh) &#8211;<a title="Python File Object" href="http://docs.python.org/2/library/stdtypes.html#bltin-file-object" target="_blank"> http://docs.python.org/2/library/stdtypes.html#bltin-file-object</a>s (Look under file.next())

Now that you have an idea of our example, maybe the though went through your head that we would likely do that operation again, but on another file. Lets apply the DRY principal and convert it to a function.

> <pre>&gt;&gt;&gt; def printFastaIdentifiers( fastafile ):
&gt;&gt;&gt;     fh = open( fastafile )
&gt;&gt;&gt;     for lineinfile in fh:
&gt;&gt;&gt;         if lineinfile.startswith( '&gt;' ):
&gt;&gt;&gt;             print lineinfile
&gt;&gt;&gt;     fh.close()</pre>

That was easy right? Just generalized that piece of code. To use the function just simply call it like this

> <pre>&gt;&gt;&gt; printFastaIdentifiers( 'myfastafile.fasta' )</pre>

Lets make it a module so we can import it later on and use it.

Save the function(Don&#8217;t put the >>> in the beginning of the lines!) in a file called fastautils.py

Now, while in the same directory as your fastautils.py open the python interpreter.

> <pre>&gt;&gt;&gt; from fastautils import printFastaIdentifiers
&gt;&gt;&gt; printFastaIdentifiers( 'myfastafile.fasta' )</pre>

Now you are really rolling in the right direction. I leave the rest for you to explore.

# A few tips

  * Think of Python as an instructional language, well all programming languages are basically that, but lets focus on Python.
  * Each line you put in is a single instruction. Put a bunch of instructions together to make a script(Module). Put a bunch of modules together and build an Application.
  * Any time you find yourself repeating code or even if the code is not 100% the same but close think of the <a title="Wikipedia DRY" href="http://en.wikipedia.org/wiki/Don't_repeat_yourself" target="_blank">DRY</a> principal.
  * Another good principal to follow is the Do One Thing and Do it Well. That is, don&#8217;t over complicate your scripts.
  * Make sure what you are doing isn&#8217;t already done. Check <a title="Python 2.7 Library" href="http://docs.python.org/2/library/" target="_blank">here</a> and <a title="PyPi Modules" href="http://pypi.python.org/pypi" target="_blank">here</a> for modules that may doing what you are trying to do.
  * Functions, functions functions. Write a function for every piece of the script that does a single task. Part of the DRY principal.

# Conclusion

You may feel that this post really isn&#8217;t that helpful. There is still so much you may not understand.

Python is pointless unless you explore with it. The best way to start learning is to to just struggle through until it starts to click with you. Every time you find yourself repeating some manual operation, think about exactly what you are doing and what steps are needed. Then try to do it using some programmatic method. In the beginning it will take you much much longer to write a script to automate a simple task, but in the beginning it is not about saving time, it is about investing in your future. Spend the time now and trust me, the payoff will be huge.

Frustrated to no end? Leave a comment and I will respond.
