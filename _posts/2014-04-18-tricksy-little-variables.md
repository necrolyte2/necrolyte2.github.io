---
id: 1144
title: Tricksy Little Variables
date: 2014-04-18T07:22:17+00:00
author: tyghe
layout: post
guid: /?p=1144
permalink: /tricksy-little-variables/
categories:
  - Friday Linux
  - How To
  - Technical Computing
tags:
  - array
  - bash
  - manipulation
  - string
  - substitution
  - substring
  - variables
---
[Last week](/how-many-commands-can-you-memorize/ "How many commands can you memorize") we reviewed a bunch of Linux commands. This week we will go over bash variables and all the fun things that you can do with them.

First, we will need to explore a bit about how to use the basics of bash variables. As in any programming language, variables hold values or hold a list of values called an array. That is the basics.

In bash variables have two forms for when you want to access and when you want to set the value of them.

## Setting Variables

When you want to set the value of a variable you just name the variable with an equal sign after it just like this

    myvariable=5
    myvariable2="Text in quotes"

**Just make sure you do not put spaces on either side of the equals sign**

## Accessing Variables

When you want to access the variable&#8217;s you have to put a dollar sign in front of the variable name

    echo $myvariable
    echo $myvariable2
    echo ${myvariable}
    

Would print the values of both variables to the terminal. Notice you can also put {} around the variable name which I almost always do because it removes problems when you try to do something like

    var1="/some/path/"
    echo $var1more/path/stuff
    echo ${var1}more/path/stuff
    

In the first echo statement bash has no way to know that the variable name is var1 and not var1more. So if you wrap it in {} you don&#8217;t have to worry about that issue any more. You will see later that the {} also allows you to do some other fun things.

## Export

For the longest time I really didn&#8217;t know what the heck the export command did. Then I did a little research on it and it is pretty straight forward.
  
When you set a variable normally by just doing something like

    var1="Some Text"
    

This variable is only available to the shell you are in. So if you then try something like this

    python -c "import os; print os.environ['var1'];"
    

You will get a KeyError exception that variable does not exist. This tells you that when python executed that command in it&#8217;s own process, the environment of that process did not contain the variable var1

The export command makes a variable available to the current shell and all child processes. Aka, any program that you execute from the shell you define the variable in will have access to it as well.

    export var1
    python -c "import os; print os.environ['var1'];"
    

This prints Some Text now !!!

## Arrays

Arrays are simply variables that have multiple values. That is, a list of values that you assign to a single variable name.
  
Arrays are assigned in a very similar manner.

    arr=( value1 value2 value3 )
    arr2=( $(ls) )
    

There are many ways to create an array. These are just two. The basics of creating an array is that you put parenthesis around the values. I think of it as telling bash to do a split on the values or something.
  
Anyways, how do you get the individual values out of the array? It is very similar to regular variables. If you are familiar with arrays then this will be nothing too new.

    echo "First item of the array: ${arr[0]}"
    echo "All items of the array: ${arr[@]}"
    echo "Number of items in array: ${#arr[@]}"
    

Try it out. Poke it a bit. See how you like it.

## String Manipulation

Because text processing is possible the most fun thing to do, here are some quick ways to play around with variables that contain strings as their values.

Here is our example string

    mystr="ABCDEF.txt"
    

**String Length**
  
Same as array length(Not surprising since a string is essentially an array of characters)

    echo ${#mystr}

**Substrings**

    echo "${mystr:0}" # A
    echo "${mystr:0:2}" # AB
    echo "${mystr: -3}" # txt
    

**Removing Portions of Strings**
  
Honestly, I would be lying if I didn&#8217;t say I had to look these up almost every time I use them.
  
[Here](http://tldp.org/LDP/abs/html/string-manipulation.html "String Manipulation Bash") is where I get the info from

Think of the # and ## as the operators that remove from the left
  
\## Removes as much as it can of the substring on the right side of it as it can
  
\# Removes the shortest match
  
_This is confusing. It is ok. Just skim over it and know it is possible and don&#8217;t give up trying to get it to work_

    echo "${mystr##*.}" # txt
    

Think of % and %% as the operator that removes from the right. I often use these to remove file extensions and the like.

    echo "${mystr%.txt}"
    

## String Substitution

It exists. I just found this out while reading through [this](http://tldp.org/LDP/abs/html/string-manipulation.html "String Manipulation Bash")
  
So so very awesome. Before I was always using sed in a subshell to do this. Bash is so awesome!
  
I used to do this

    mystr=$(echo $mystr | sed 's/.txt/.csv/')
    

but now I can do this

    mystr=${mystr/.txt/.csv}
    

This just made my day! I&#8217;m so gitty right now.
  
I&#8217;m probably forgetting some other fun things, but time is ticking away. Go forth and explore
