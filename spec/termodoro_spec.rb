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

  it "ends up with a well-formed string to be issued as a system command" do
    expect(term.command).to be_an_instance_of(String)
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
      term_alt = Termodoro.new(no_message_arg)
      expect(term_alt.command).to be_an_instance_of(String)
    end

    describe "Flexibility on wording of unit of time" do
      it "will accept partial matches of 'seconds' (i.e. s sec secs second seconds)" do
        weird_seconds = "10 s"
        term_alt = Termodoro.new(weird_seconds)
        expect(term_alt.calculate_time).to eq(10)
      end

      it "will accept partial matches of 'minutes' (i.e. m min mins minute minutes)" do
        weird_minutes = "10 min"
        term_alt = Termodoro.new(weird_minutes)
        expect(term_alt.calculate_time).to eq(600)
      end

      it "will accept partial matches of 'hours' (i.e. h hr hrs hour hours)" do
        weird_hours = "1 hr"
        term_alt = Termodoro.new(weird_hours)
        expect(term_alt.calculate_time).to eq(3600)
      end

      it "allows user to smush time unit directly onto decimal without a space (i.e. 10secs, 5minute, etc.)" do
        spaceless_seconds = "10secs"
        term_alt = Termodoro.new(spaceless_seconds)
        expect(term_alt.calculate_time).to eq(10)
      end

    end
  end

  describe "Internal logic" do
    it "can calculate the time given a unit of time" do
      minute_message = "5 minutes"
      term_alt = Termodoro.new(minute_message)
      expect(term_alt.calculate_time).to eq(300)
    end

    it "can santize the message" do
      pending "This feature needs to be built. Sort of important."
    end

  end

  describe "Command line behavior and other shell support" do
    it "Coming soon..." do
      pending "This needs to be built and explored"
    end
  end

end


