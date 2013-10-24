require_relative 'termodoro'

class Run
  def self.execute(input)
    a = Termodoro.new(input)
    exec(a.command)
  end
end