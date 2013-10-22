Termodoro
=========

*This is a work-in-progress*

## What is this?

**Termodoro** is on its way to being a lightweight command-line pomodoro timer / reminder message app. It'll be a gem.  
The idea is that you run it with options for duration and message. It sits in the background, out of your way, waiting for as long as you specified and then showing the message you wrote.  
It will work something like:

`termodoro 1 hour "call girlfriend back"`  
or  
`termodoro 5 mins "make a commit."`  
or  
`termodoro 20m "switch driver/navigator in pair programming"`  

I imagine it'll be good for simple reminders (get up and walk around for a minute, call that person who just texted you, stop coding and eat lunch, etc.) or pomodoro workflows. The main goal is that it is incredibly easy to use from the command line so that you can set it ultra-quickly without losing your current train of thought.  
Too often I avoid setting a simple reminder because I don't want to interrupt my current flow - that shouldn't be a thing.

-----

## Things I need to do:

- The biggest one:
  - ~~[Make it a gem!](https://rubygems.org/gems/termodoro)~~ 
- After that:
  - Object-Orient (shame on me.) / Actually think about design.
  - Instead of getting input from `gets`, the duration and message should be able to be passed in as flags/options (I need to figure out the difference.)
  - set defaults to something agreeable (like maybe 20 minutes and some generic 'do that thing you wanted to do' message)
  - Make it useable in other shells and without the terminal-notifier gem.
  - A bunch of other stuff I'll add here

## Upcoming features:

- set your own global defaults and shortcuts
- option to set a reminder to repeat
- other stuff.. don't want it to get bloated though.
