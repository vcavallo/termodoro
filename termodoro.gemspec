require './lib/termodoro/version'
require './lib/termodoro/termodoro'


Gem::Specification.new do |s|
  s.name        = 'termodoro'
  s.version     = Termodoro::Version::VERSION
  s.date        = Time.now.utc.strftime("%Y-%m-%d")
  s.summary     = "A lightweight CL reminder app"
  s.description = "Use this little utility to set simple reminders from the command line. See the github page below for more information"
  s.authors     = ["Vinney Cavallo"]
  s.email       = 'vcavallo@gmail.com'
  s.files       = `git ls-files`.split("\n")
  s.homepage    =
    'https://github.com/vcavallo/termodoro'
  s.license       = 'MIT'
  s.executables << 'termodoro'
  s.require_paths = ['lib', 'bin', 'config']

  s.add_runtime_dependency "terminal-notifier"
  s.add_runtime_dependency "rake"
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'json'
end
