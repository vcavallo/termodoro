require_relative './config/environment'

class Run
  a = Termodoro.new("5 s test")
  exec(a.command)
end