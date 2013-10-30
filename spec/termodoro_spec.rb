require_relative 'spec_helper'

describe "Termodoro" do

  it "takes a well-formed time and message string" do
    arg = "10 seconds do something"
    term = Termodoro.new(arg)
    term.command.should be_an_instance_of(String)
  end

  it "can parse and retreive the decimal provided" do
    arg = "5 minutes do something"
    term = Termodoro.new(arg)
    expect(term.parse_number_of_units).to eq(5)
  end 

  it "allows the message to be optional" do
    arg = "10 seconds"
    term = Termodoro.new(arg)
    term.command.should be_an_instance_of(String)
  end
end


