require_relative 'spec_helper'

describe "Termodoro" do
  it "takes a well-formed time and message string" do
    arg = "10 seconds do something"
    term = Termodoro.new(arg)
    term.command.should be_an_instance_of(String)
  end

  it "allows the message to be optional" do
    arg = "10 seconds"
    term = Termodoro.new(arg)
    term.command.should be_an_instance_of(String)
  end
end
