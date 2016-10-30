---
id: 1128
title: Redmine on Heroku
date: 2014-03-04T22:47:19+00:00
author: tyghe
layout: post
guid: /?p=1128
permalink: /redmine-on-heroku/
categories:
  - Technical Computing
tags:
  - cleardb
  - git
  - heroku
  - redmine
---
Since this isn&#8217;t as easy as some posts make it here is how I got it to work:

<!--more-->

**Clone the redmine git repo and have the 2.4-stable branch checked out**

> git clone https://github.com/redmine/redmine.git -b 2.4-stable

**Remove the following from your .gitignore**

  * Gemfile.lock
  * Gemfile.local
  * public/plugin_assets
  * config/initializers/session_store.rb
  * config/initializers/secret_token.rb
  * config/configuration.yml
  * config/email.yml
  * config/database.yml

**Install all the gems with bundle. I had to install some packages to get this to work as well since I don&#8217;t muck with ruby too much**

>     apt-get install libmagickwand-dev python-dev
>     bundle install
>     

**Now create your heroku app which will setup a git remote for you**

>     heroku create myappname
>     

**Edit config/environment.rb and remove/comment the exit 1 line**

**Edit config/application.rb and add the following line just below class Application < Rails::Application**

> config.assets.initialize\_on\_precompile = false

**Setup your database stuff. I used the ClearDB module so had to do the following:**

> [https://devcenter.heroku.com/articles/cleardb#configuring-your-ruby-application-to-use-cleardb](https://devcenter.heroku.com/articles/cleardb#configuring-your-ruby-application-to-use-cleardb "ClearDB Rails Setup")

_If you won&#8217;t want to use ClearDB i&#8217;m pretty sure if you don&#8217;t do anything it will use Postgres automatically&#8230;probably_

**Add and commit your changes**

> git add -A
  
> git commit -m &#8220;prepping for heroku&#8221;
  
> git push heroku 2.4-stable:master

**Rake stuff**

>     heroku rake generate_secret_token
>     heroku run rake db:migrate
>     heroku run rake redmine:load_default_data

<pre><strong>Sites I used for reference:
</strong></pre>

  * <a href="http://railsguides.net/2012/04/28/how-to-deploy-redmine-to-heroku/" target="_blank"><span style="font-family: Consolas, Monaco, monospace;"><span style="font-size: 12px; line-height: 18px;">http://railsguides.net/2012/04/28/how-to-deploy-redmine-to-heroku/</span></span></a>
