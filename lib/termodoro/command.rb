class Command
  # A class for generating system commands for a given OS
  #
  # @param time [integer] The time delay for the command
  # @param message [string] The message to be displayed in the notification
  # @param os [string] The target operating system for the command
  def initialize(time, message, os)
    @time, @message, @os = time, message, os
  end

  # Generates the bash string that should be executed
  def to_s
    if @os =~ /darwin|mac os/
      "sleep #{@time} && terminal-notifier -message '#{@message}' -title 'Termodoro' & disown"
    else
      "#{nix_shell} -c \"sleep #{@time} && notify-send Termodoro '#{@message}' -i #{icon_path} & disown\""
    end
  end

  private
  def nix_shell
    shell = %x(getent passwd `whoami` | cut -d: -f7)
    shell.strip
  end

  def icon_path
    "#{Dir.pwd}/bin/terminal-64.png"
  end
end