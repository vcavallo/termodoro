require 'pry'

###> WIP Class. Procedural below <###

class Termodoro

  def initialize
    @how_long
    # message
    # title on/off
  end

  def time_part
    # parse parse parse

    #=> return the part of the string that describes
    #=> hours/minutes/seconds
  end

  def number_part
    # parse parse parse

    #=> return the part of the string that describes
    #=> the number of time_parts given
  end

  def calculate_time
    if @how_long.minutes?
      # method to calculate seconds from minutes
    elsif @how_long.hours?
      # method to calculate seconds from hours
    elsif @how_long.seconds?
      # return seconds
    end
  
    seconds #=> returns seconds
  end

  def run
    # if title on/off call one or the other
      #=> returns the terminal call (this will need to change)
  end

  def seconds?
    # takes time_part
    # true if time_part is a version of "seconds"
    #=> true/false
  end

  def minutes?
    # takes time_part
    # true if time_part is a version of "minutes"
    #=> true/false
  end

  def hours?
    # takes time_part
    # true if time_part is a version of "hours"
    #=> true/false
  end

  def clean_message
    # will need something to sanitize apostrophes and stuff
    #=> return sanitized message to insert into terminal
  end

end


###> procedural code below. object archiecting happening above <###

puts "how long? (write only a number for minutes)"
length_response = gets.chomp
number = length_response.split(" ").first.to_i
segment = length_response.split(" ").last
duration = 5

if segment == "seconds" || segment == "sec" || segment == "secs" || segment == "s"
  duration = number
elsif segment == "m" || segment == "min" || segment == "mins" || segment == "minutes" || segment == ""
  duration = number * 60
elsif segment == "h" || segment == "hour" || segment == "hours"
  duration = number * 3600
end

puts "what message?"
message = gets.chomp
puts "enter a title here if you want one,"
puts "otherwise, just hit enter"
title = gets.chomp

if title == ""
  system("sleep #{duration} && terminal-notifier -message '#{message}' & disown && exit")
else
  system("sleep #{duration} && terminal-notifier -message '#{message}' -title '#{title}' & disown && exit")
end
