Gem::Specification.new do |s|
  s.name        = 'termodoro'
  s.version     = '0.2.5'
  s.date        = '2013-10-24'
  s.summary     = "A lightweight CL reminder app"
  s.description = "Use this little utility to set simple reminders from the command line. See the github page below for more information"
  s.authors     = ["Vinney Cavallo"]
  s.email       = 'vcavallo@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.executables << 'termodoro'
  s.add_runtime_dependency "terminal-notifier"
  s.homepage    =
    'https://github.com/vcavallo/termodoro'
  s.license       = 'MIT'

  s.add_development_dependency 'rspec'
end
