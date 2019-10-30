---
id: 1301
title: Golang vs. Ratpack
date: 2019-10-30T09:00:00+00:00
author: tyghe
layout: post
guid: /?p=1301
permalink: /golangratpack
categories:
  - Tech
  - Golang
  - Go
  - Ratpack
  - Java
  - Groovy
---

Over the past few weeks I've started learning [Ratpack](https://ratpack.io/)
since it is a fairly popular framework where I work. It is an emerging new
framework that is really centered around making Asynchronous programming in 
JVM languages easier.

Additionally, I've also been working on a side project at work written in
[GoLang](https://golang.org/). While Golang(Go) can be considered a language and
ratpack more of a framework(Since it can be written in Kotlin or Groovy which
are both languages), I'm still going to compare them both as if they were
languages since Ratpack really brings along its own syntax.

So just a little bit about the two projects for background as they do differ in
scope quite a bit.

### Ratpack Project

The Ratpack project I chose was basically to have a simple API endpoint that
accepts a 4 alpha-numeric code that represents a Target store and returns the 
store operating hours as well as if the store is a new store(has not opened to
public yet) or if it is an existing store. This means I not only had to expose
a REST endpoint but I also had to utilize an HTTP client to call a REST API
hosted somewhere else. Then parse the results and return them back to the
user that called my endpoint.

Quite literally just a small project to learn Ratpack. I tried to keep the scope
as small as possible to avoid unnecessary injecting extra "learning adventures"
into the tech stack.

### Golang Project

The Golang project is a client library that allows others to import it and
easily interact with a database abstraction service run at Target. I can't really
go into details about that project, but basically the client is simply a
wrapper around another API. I was initially inspired by a few other client
libraries I wrote in Python and how easy it is to wrap API's using Python's
object model where you can do things like this:
```
import requests

class APIWrapper(object):
  def __init__(self, url, user, pass):
    self.url = url
    self.user = user
    self.pass = pass

  def __getattr__(self, name):
    return path(name)

  def path(self, path):
    newurl = self.url + '/' + path
    return APIWrapper(newurl, self.user, self.pass)

  def call(self, method):
    request_method = getattr(requests, method)
    return request_method(newurl, auth=(self.user, self.pass))
```
Then if the API you are calling is laid out such that endpoints are truly Restful
such as `/foo/<object>/<key>` and allow you to do `POST`, `PUT`, `GET`, `DELETE`
against these types of URL schemes you can easily use this wrapper such as:
```
client = APIWrapper('http://example.com', 'user', 'pass')
```
```
r = client.foo.myobject.mykey("GET")
```
-- or --
```
r = client.path('foo').path('myobject').path('mykey')("GET")
```
Now `r` will have a response object after making a `GET` to `http://example.com/foo/myobject/mykey`

**Disclaimer**: I didn't test the above code, so there are probably some simple
mistakes in it, however, the concept works great!

So back to Go, the idea was that I wanted to replicate the APIWrapper pattern.
Yes, I'm sure there is some specific technical term for what APIWrapper is doing
but I'm not really big on technical terms so APIWrapper pattern it is!

Turns out you can mostly replicate the python code above, but since I'm fairly
new to Golang I wasn't sure if you could easily replicate the `__getattr__`
portion so just stuck with implementing `Path(...)` which works fine and is
a little more straight forward on what is going on.

## Biases

Before I dive into my comparison it is probably best to talk about some of my
personal preferences and biases. One thing I dislike about reading other
articles like this is that they don't talk about their personal preferences, but
you can clearly see them defined in how they compare things.

Probably the most important things to me, which will be no surprise to anybody
that works with me, is that I have a very strong affinity towards VIM, Bash,
Linux and Python. Anything that falls outside of this tech ecosystem better be 
easy to mold into it. That is, if I cannot write code easily in VIM and get
all the niceties such as syntax highlighting, code formatting, code building,
code running can take a hike right off a cliff into a pile of sharp rocks!

## Comparison

It is probably a bit silly to compare the two using these two projects since
the projects are fundamentally different, but I think the core comparison will
still be valid.

Overall it probably won't surprise you, but I liked my Golang experience more.
What really did surprise me though was that in all of the Groovy/Java/Spring/Beans
experiences I've had in the past, Ratpack has been the best. Maybe it can just
hike to the top of the cliff and not fall into the pit of rocks.

### Golang
You can tell that things are really thought out well. The learning curve was
not really not that steep. You don't get burdened by having to learn so many things
all at once. Simply write your code. Run `go build`. Execute code! Really,
that is it. This is of course assuming you have jumped through the `GOPATH`
hurdles. Really, WTF was Google thinking with this whole `GOPATH` thing?
All I can say is, if you want to do a Go project just make a directory in your
home directory called `src` and then for every code repository site you upload
to make a directory for it (Example `~/src/github.com`). Then put your project
inside that directory(Example `~/src/github.com/myproject`). Last, you should
just be able to set your `GOPATH` to `~/` and things "should" work.

Few other things that I really liked:
- Godoc - wow, comes with the language basically and standardized formatting 
  for docs. Tool is super easy to get and use
- The compiler is so picky about formatting. No more "well I like 2 spaces" or 
  "i do it this way". No! This is the way everybody formats their code and you 
  don’t get to compile unless you do it that way.
- Works easily with VIM. It really doesn’t matter what editor you use, but so 
  far in my experience if you cannot easily write in VIM and get syntax 
  highlighting, formatting, compiler errors working out of the box, there are 
  other issues. Java is honestly impossible to get to work in VIM without doing
  crazy things involving Eclipse. Scares the shit out of me.
- Tons of documentation for everything and things make sense with very little 
  effort. Ratpack specifically is a nightmare when it comes to finding 
  information about anything. It really feels like tribal knowledge here at 
  Target. If you want to learn Ratpack you have to either endure the learning 
  curve of figuring everything out or find somebody who already knows it and 
  learn from them. Also, who else uses Ratpack in the industry? Maybe there 
  are quite a few others, but seems like it is not really widely used?
- You can compile for whatever OS you want. Don’t need a JVM installed just run 
  the binary. This is also a pitfall of python/ruby… You can’t just run the 
  app, you have to ensure python is installed and also whatever libraries it 
  needs.

Writing in Go was fun and each thing I had to learn wasn’t a huge 
hurdle as the docs are so straight forward for anything in Golang(not to mention
there are docs for everything).

### Ratpack

When I was developing the Ratpack app it felt overwhelming for the most part.
Where do I start? Docs say to do this, if you are lucky and there are docs, 
but every example on the web is different than what that says. Who do I trust 
now, stack overflow or Ratpack docs? And don't even get me started on the 
Ratpack docs, just head over yourself and learn about the 
[Registry](https://ratpack.io/manual/current/handlers.html#registry). Nothing 
like finding a few `TODO` blocks in there. It felt like the docs were written 
by somebody who knows Ratpack too well and very minor things were skipped over.

It felt like being a toddler. One minute you are just blasting away at code 
happy as can be and the next minute you are crying in your room because 
`null pointer exception` and don't understand what changed nor what is going 
on. It really felt like everything is this smoke and 
mirrors show. Where does this variable come from? 10 minutes of digging later 
on the Google: “It is injected automatically for you through this mechanism 
that you would only know about if you have been a Java 
developer for 5 years”. Maybe I just really hate code automatic code injection.
It was something I really despised about Spring Boot as well.

One thing that really made the whole experience tough was the fact that in order
to even start doing anything with Ratpack, I had to first figure out how to use
IntelliJ. Then how do I setup Gradle. Then how do I start writing the project.
There was too much involved in just getting started. Maybe it is an unfair comparison
since there are quite a few IntelliJ users out there and they might look at
using VIM as the same learning curve.

Few other thoughts:
- Groovy, Kotlin, Scala? What the hell is going on? So there are many different 
  languages now that are based on the JVM or is it Java? Can we just kill java 
  and move on now that it is 2019?
- Ratpack specifically is a nightmare when it comes to finding 
  information about anything. If you want to learn Ratpack you have to either 
  endure the learning curve of figuring everything out or find somebody who 
  already knows it and learn from them.

Writing the app in Ratpack was quite the journey. In the end I did feel like
I had finally gotten to the point where I understood at a very minimal level,
how it works. I'm still not 100% sure about how the Registry works and how
all of the auto-injection works either, but I feel that knowledge would come
after working with it a bit more.

I did find an article that really helped which I highly recommend if you are
going to plunge into Ratpack.
https://danhyun.github.io/mastering-async-ratpack/

