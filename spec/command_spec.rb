require_relative 'spec_helper'

describe Command do
  it "can generate a system command for *nix" do
    command = Command.new(7, 'Bring the ruckus.', 'linux-gnu')
    # expect(command.to_s).to eq("sleep 7 && notify-send Termodoro 'Bring the ruckus.' & disown")
    expect(command.to_s).should =~ /notify-send/
    # eq("sleep 7 && notify-send Termodoro 'Bring the ruckus.' & disown")
  end

  it "can generate a system command for OSX" do
    command = Command.new(7, 'Enter the 36 chambers', 'darwin12.3.0')
    expect(command.to_s).should =~ /terminal-notifier/
  end
end