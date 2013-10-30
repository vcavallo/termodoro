
class Termodoro
  attr_accessor :time_unit, :number_of_units, :message
  # @!attribute time_unit
  #   @return the unit of time specified by the user.
  # @!attribute number_of_units
  #   @return the number of units of time specified by the user.
  # @!attribute message
  #   @return the message specified by the user.

  # Used to get the number of seconds in a minute.
  SECS_IN_MIN = 60
  # Used to get the number of seconds in an hour.
  SECS_IN_HOUR = 3600

  # @param arguments [String] The arguments passed in by the user at the command 
  #   line. this includes the time after which the reminder will appear and an 
  #   optional message to appear in the body of the reminder.
  def initialize(arguments)
    @arguments = arguments
  end

  # Looks into the user-supplied arguments and retreives the unit of time. 
  # @return [String] a version of hours, minutes or seconds, depending on
  #   how the user inputs it ("s", "Sec", "seconds", etc.)
  def parse_time_unit
    segment = @arguments.match(/\D+/)[0].split(' ').first
    self.time_unit = segment
  end

  # Looks into the user-supplied arguments and parses out the number of units of
  #   time.
  # @return [Integer] the number of units of time given by the user
  def parse_number_of_units
    number = @arguments.scan(/[\d]+/).first.strip.to_i
    self.number_of_units = number
  end

  # 
  def parse_message
    # .split(/[\d]+.[\w]+/).last 
    parsed_message = @arguments.split(/^\s*[\d]+\s*[\w]+/).last || 'Termodoro'
    self.message = parsed_message.strip
  end

  def calculate_time
    if minutes?
      seconds = parse_number_of_units * SECS_IN_MIN
    elsif hours?
      seconds = parse_number_of_units * SECS_IN_HOUR
    elsif seconds?
      seconds = parse_number_of_units
    end

    seconds #=> returns seconds
  end

  def seconds?
    seconds = %w[s sec secs second seconds]
    true if seconds.include?(parse_time_unit)
    #=> true/false
  end

  def minutes?
    minutes = %w[m min mins minute minutes]
    true if minutes.include?(parse_time_unit)
    #=> true/false
  end

  def hours?
    hours = %w[h hr hrs hour hours]
    true if hours.include?(parse_time_unit)
    #=> true/false
  end

  def clean_message
    parse_message
    # will need something to sanitize apostrophes and stuff
    #=> return sanitized message to insert into terminal
  end

  def command
    # title = "title" -- leaving off title for now.
    # if title on/off call one or the other
    time_unit = calculate_time
    msg_part = parse_message
    "sleep #{time_unit} && terminal-notifier -message '#{msg_part}' -title 'Termodoro' & disown"
    #=> return the fully-formed command string for Bash
  end

end
