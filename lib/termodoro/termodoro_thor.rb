require_relative './version'
require 'thor'
require 'chronic'
# A new instance of this class takes user-input as command line arguments and 
# prepares a string to be execute as a Bash system command. The user specifies an
# amount of time and an optional message to display. After the amount of time elapses
# a terminal-notifier message appears with the message - if the message was omitted,
# the word "Termodoro" appears instead.

class Timer < Thor
  # option :minutes, type: :numeric, aliases: 'm'
  # option :hours, type: :numeric, aliases: 'h'
  # option :seconds, type: :numeric, aliases: 's'
  option :say, aliases: 's', default: "Remember to do that thing."
  option :duration, aliases: 'd', required: true

  desc "timer", "something happens"
  def timer
    parsed_time = Chronic.parse(options[:duration])
    timer_duration = parsed_time - Time.now
    puts "reminder set for #{parsed_time.strftime("%A,%l:%M%p")}"
    puts options[:say]
    puts "(time difference: #{timer_duration} seconds)"
    exec("sleep #{timer_duration} && terminal-notifier -message '#{options[:say]}' -title 'Termodoro' & disown")
  end
  default_task :timer

  # def parse_time_unit
  #   segment = @arguments.match(/\D+/)[0].split(' ').first
  #   self.time_unit = segment
  # end

  # # Looks into the user-supplied arguments and parses out the number of units of
  # # time.
  # # @return [Integer] the number of units of time given by the user.
  # def parse_number_of_units
  #   number = @arguments.scan(/[\d]+/).first.strip.to_i
  #   self.number_of_units = number
  # end

  # # Looks into the user-supplied arguments and returns the message, if one is present.
  # # If not, sets the message to "Termodoro".
  # # @return [String] the optional message given by the user.
  # def parse_message
  #   # .split(/[\d]+.[\w]+/).last 
  #   parsed_message = @arguments.split(/^\s*[\d]+\s*[\w]+/).last || 'Termodoro'
  #   self.message = parsed_message.strip
  # end

  # # Depending on what unit of time is being used, determines the number of seconds
  # # using multiplication by {Termodoro::SECS_IN_MIN SECS_IN_MIN} and 
  # # {Termodoro::SECS_IN_HOUR SECS_IN_HOUR} constants. The check to #seconds? is 
  # # not necessary, but feels nice.
  # # @see #parse_number_of_units
  # # @see #seconds?
  # # @see #minutes?
  # # @see #hours?
  # # @return [Integer] total number of seconds for which to wait until the reminder
  # #   is displayed.
  # def calculate_time
  #   if minutes?
  #     seconds = parse_number_of_units * SECS_IN_MIN
  #   elsif hours?
  #     seconds = parse_number_of_units * SECS_IN_HOUR
  #   elsif seconds?
  #     seconds = parse_number_of_units
  #   end

  #   seconds
  # end


  # # Truthy if user has input a number of seconds.
  # # @return [Boolean] 
  # # @see #parse_time_unit
  # def seconds?
  #   seconds = %w[s sec secs second seconds]
  #   true if seconds.include?(parse_time_unit)
  # end

  # # Truthy if user has input a number of minutes. 
  # # @return [Boolean] 
  # # @see #parse_time_unit
  # def minutes?
  #   minutes = %w[m min mins minute minutes]
  #   true if minutes.include?(parse_time_unit)
  # end

  # # Truthy if user has input a number of hours. 
  # # @see #parse_time_unit
  # # @return [Boolean] 
  # def hours?
  #   hours = %w[h hr hrs hour hours]
  #   true if hours.include?(parse_time_unit)
  # end

  # # PENDING - will eventually be used to ensure user input is safe to run as terminal
  # # command. (i.e. remove special punctuation and the like).
  # # @return [String] sanitized message.
  # # def clean_message
  # #   parse_message
  # # end

  # # Workhorse method: Runs #calculate_time and #parse_message, taking the results
  # # of those methods and creating the string to execute.
  # # @see #calculate_time
  # # @see #parse_message
  # # @return [String] the fully-formed command string ready to be run by bash as 
  # #   a system command.

  # def command
  #   time_unit = calculate_time
  #   msg_part = parse_message
  #   "sleep #{time_unit} && terminal-notifier -message '#{msg_part}' -title 'Termodoro' & disown"
  # end

end

class Termodoro < Thor
  include VersionModule
  attr_accessor :time_unit, :number_of_units, :message
  attr_reader :arguments
  # @!attribute time_unit
  #   @return [String] the unit of time specified by the user.
  # @!attribute number_of_units
  #   @return [Integer] the number of units of time specified by the user.
  # @!attribute message
  #   @return [String] the message specified by the user.

  option :message, aliases: 'm'
  option :pause, aliases: 'p'
  option :status, aliases: 's'
  option :resume, aliases: 'r'
  option :timer, aliases: 't'

  desc 'start', 'Starts the default Termodoro routine'
  def start
    puts "Termodoro started!"
    puts "Started with message: #{options[:message]}" if options[:message]
    puts "Termodoro paused!" if options[:pause]
    puts "The status is..." if options[:status]
    puts "Resuming." if options[:resume]

    options[:message] ? message = options[:message] : message = "some default"

    time = 2

    exec("sleep #{time} && terminal-notifier -message '#{message}' -title 'Termodoro' & disown")
  end

  desc "timer", "does some sort of thing"
  subcommand "timer", Timer


  # Looks into the user-supplied arguments and retreives the unit of time. 
  # @return [String] a version of hours, minutes or seconds, depending on
  # how the user inputs it ("s", "Sec", "seconds", etc.)

  # def parse_time_unit
  #   segment = @arguments.match(/\D+/)[0].split(' ').first
  #   self.time_unit = segment
  # end

  # # Looks into the user-supplied arguments and parses out the number of units of
  # # time.
  # # @return [Integer] the number of units of time given by the user.
  # def parse_number_of_units
  #   number = @arguments.scan(/[\d]+/).first.strip.to_i
  #   self.number_of_units = number
  # end

  # # Looks into the user-supplied arguments and returns the message, if one is present.
  # # If not, sets the message to "Termodoro".
  # # @return [String] the optional message given by the user.
  # def parse_message
  #   # .split(/[\d]+.[\w]+/).last 
  #   parsed_message = @arguments.split(/^\s*[\d]+\s*[\w]+/).last || 'Termodoro'
  #   self.message = parsed_message.strip
  # end

  # # Depending on what unit of time is being used, determines the number of seconds
  # # using multiplication by {Termodoro::SECS_IN_MIN SECS_IN_MIN} and 
  # # {Termodoro::SECS_IN_HOUR SECS_IN_HOUR} constants. The check to #seconds? is 
  # # not necessary, but feels nice.
  # # @see #parse_number_of_units
  # # @see #seconds?
  # # @see #minutes?
  # # @see #hours?
  # # @return [Integer] total number of seconds for which to wait until the reminder
  # #   is displayed.
  # def calculate_time
  #   if minutes?
  #     seconds = parse_number_of_units * SECS_IN_MIN
  #   elsif hours?
  #     seconds = parse_number_of_units * SECS_IN_HOUR
  #   elsif seconds?
  #     seconds = parse_number_of_units
  #   end

  #   seconds
  # end


  # # Truthy if user has input a number of seconds.
  # # @return [Boolean] 
  # # @see #parse_time_unit
  # def seconds?
  #   seconds = %w[s sec secs second seconds]
  #   true if seconds.include?(parse_time_unit)
  # end

  # # Truthy if user has input a number of minutes. 
  # # @return [Boolean] 
  # # @see #parse_time_unit
  # def minutes?
  #   minutes = %w[m min mins minute minutes]
  #   true if minutes.include?(parse_time_unit)
  # end

  # # Truthy if user has input a number of hours. 
  # # @see #parse_time_unit
  # # @return [Boolean] 
  # def hours?
  #   hours = %w[h hr hrs hour hours]
  #   true if hours.include?(parse_time_unit)
  # end

  # # PENDING - will eventually be used to ensure user input is safe to run as terminal
  # # command. (i.e. remove special punctuation and the like).
  # # @return [String] sanitized message.
  # # def clean_message
  # #   parse_message
  # # end

  # # Workhorse method: Runs #calculate_time and #parse_message, taking the results
  # # of those methods and creating the string to execute.
  # # @see #calculate_time
  # # @see #parse_message
  # # @return [String] the fully-formed command string ready to be run by bash as 
  # #   a system command.

  # def command
  #   time_unit = calculate_time
  #   msg_part = parse_message
  #   "sleep #{time_unit} && terminal-notifier -message '#{msg_part}' -title 'Termodoro' & disown"
  # end

end
