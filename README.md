# Termodoro

## What is this?

***Termodoro*** is an ultra-simple, frictionless BASH reminder / pomodoro timer ( in fact it's portmanteau of *terminal* and *[pomodoro](http://en.wikipedia.org/wiki/Pomodoro_Technique)* )  
You pass it an amount of time and a message. After the specified amount of time elapses the message pops up. *Simple!*

## Why would I use this?

Maybe you're hard at work coding and you realize that there's something you need to do in 10 minutes… Rather than try to remember on your own or risk derailing your excellent programming groove by firing up a bulky reminder app, just enter a simple command into your terminal (where you're probably staring anyway). Hit enter and quickly get back to what you were doing!  

Perhaps you're pair-programming and you want to switch roles in a given amount of time… Throw a quick command in between `cd`s and `ls`s and be on your way. Zero distractions. 

You're already busy. Don't also be forgetful.  
Too often I avoid setting a simple reminder because I don't want to interrupt my current flow - that shouldn't be a thing, and now it doesn't have to be.

## Useage

-----

### Install:

`gem install termodoro`

### Use:

`termodoro 40 minutes switch pairs`  
`termodoro 5m make a commit`  
`termodoro 1 hr remember to eat`  
`termodoro 10 seconds test termodoro`

..etc...

-----

## A gentle warning…

This is the first gem I've built. I do not claim that it is perfect, nor that it follows best practices, nor that it is perfectly secure. Use at your own risk and feel free to fork this repo and improve any flaws you encounter. I'm wide open to suggestions for features as well.

## Things I need to do:

- The biggest one:
  - ~~[Make it a gem!](https://rubygems.org/gems/termodoro)~~ 
- After that:
  - ~~Object-Orient (shame on me.) / Actually think about design.~~
  - ~~Instead of getting input from `gets`, the duration and message should be able to be passed in as flags/options (I need to figure out the difference.)~~
  - set defaults to something agreeable (like maybe 20 minutes and some generic 'do that thing you wanted to do' message) such that you could just do `termodoro` and it'll do that default.
  - Make it useable in other shells and without the terminal-notifier gem.
  - Sanitize the message so as to not cause bash issues
  - Write good tests!
  - Make sure to follow gem best-practices
  - A bunch of other stuff I'll add here
  - Make sure it persists through computer sleep
  - Make sure I'm using ARGV properly and issuing the system command properly
    - Generally revise to adhere to best practices. 

## Upcoming features:

- set your own global defaults and shortcuts
- option to set a reminder to repeat
- other stuff.. don't want it to get bloated though.
