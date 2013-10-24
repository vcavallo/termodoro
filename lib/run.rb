require_relative './lib/termodoro'

class Run
  def self.execute(input)
  a = Termodoro.new(input)
  exec(a.command)
end