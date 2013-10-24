require_relative '../config/environment'

###> WIP Class. Procedural below <###


class Termodoro
  attr_accessor :time_part, :number_part, :message

  SECS_IN_MIN = 60
  SECS_IN_HOUR = 3600

  def initialize(arguments)
    @arguments = arguments

    # message
    # title on/off -- probably going to drop this
  end

  def parse_time_part
    segment = @arguments.scan(/[\D]+[^\w]/).first.split(" ").first
    self.time_part = segment
    #=> hours/minutes/seconds, etc.
  end

  def parse_number_part
    number = @arguments.scan(/[\d]+/).first.strip.to_i
    self.number_part = number
    #=> the number of time_parts given
  end

  def parse_message
    # .split(/[\d]+.[\w]+/).last 
    parsed_message = @arguments.split(/^\s*[\d]+\s*[\w]+/).last.strip
    self.message = parsed_message
  end

  def calculate_time
    if minutes?
      seconds = parse_number_part * SECS_IN_MIN
    elsif hours?
      seconds = parse_number_part * SECS_IN_HOUR
    elsif seconds?
      seconds = parse_number_part
    end
  
    seconds #=> returns seconds
  end

  def seconds?
    seconds = %w[s sec secs second seconds]
    true if seconds.include?(parse_time_part)
    #=> true/false
  end

  def minutes?
    minutes = %w[m min mins minute minutes]
    true if minutes.include?(parse_time_part)
    #=> true/false
  end

  def hours?
    hours = %w[h hr hrs hour hours]
    true if hours.include?(parse_time_part)
    #=> true/false
  end

  def clean_message
    # will need something to sanitize apostrophes and stuff
    #=> return sanitized message to insert into terminal
  end

  def command
    # title = "title" -- leaving off title for now.
    # if title on/off call one or the other
    
    # this is what will be passed to the executable in that interface
    puts "sleep #{calculate_time} && terminal-notifier -message '#{parse_message}' & disown"
    #=> return the fully-formed command string for Bash
  end

end

binding.pry

###> procedural code below. object archiecting happening above <###

=begin 

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

=end