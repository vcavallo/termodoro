require_relative 'spec_helper'

describe "Termodoro" do
  let(:input) {"10 minutes show this message"}
  let(:term) {Termodoro.new(input)}

  it "can be initialized" do 
    expect(Termodoro.new("test")).to be_an_instance_of(Termodoro)
  end

  it "can accept user input" do
    expect(term.arguments).to eq(input)
  end

  describe "Constants" do
    it "has a constant that represents number of seconds in a minute" do
      expect(Termodoro::SECS_IN_MIN / 60).to eq(1)
    end

    it "has a constant that represents number of seconds in an hour" do
      expect(Termodoro::SECS_IN_HOUR / 3600).to eq(1)
    end
  end

  describe "Methods on user input" do

    # it "takes a well-formed time and message string" do
    #   expect(term.command).to be_an_instance_of(String)
    # end

    it "can parse and retreive the decimal provided" do
      expect(term.parse_number_of_units).to eq(10)
    end 

    it "can parse and retreive the unti of time provided" do
      expect(term.parse_time_unit).to eq("minutes")
    end

    it "can parse and retreive the message provided" do
      expect(term.parse_message).to eq("show this message")
    end

    it "allows the message to be optional" do
      no_message_arg = "10 seconds"
      term = Termodoro.new(no_message_arg)
      term.command.should be_an_instance_of(String)
    end
  end

  describe "Internal logic" do
    it "can santize the message" do
      pending
    end

    it "can calculate" do
      pending
    end
  end

end


