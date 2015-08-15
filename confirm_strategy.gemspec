$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "confirm_strategy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "confirm_strategy"
  s.version     = ConfirmStrategy::VERSION
  s.authors     = ["Oleh Birjukov"]
  s.email       = ["ol.birjukov@gmail.com"]
  s.homepage    = "https://gitlab.com/ror_g/confirm_strategy"
  s.summary     = "Strategy for omniauth."
  s.description = "Strategy for omniauth with confirmation (sms confirm or other)."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
end
