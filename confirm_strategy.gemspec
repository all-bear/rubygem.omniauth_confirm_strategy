$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "confirm_strategy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "omniauth-confirm"
  s.version     = ConfirmStrategy::VERSION
  s.authors     = ["Oleh Birjukov"]
  s.email       = ["ol.birjukov@gmail.com"]
  s.homepage    = "https://github.com/all-bear/rubygem.omniauth_confirm_strategy"
  s.summary     = "Strategy for omniauth."
  s.description = "Strategy for omniauth with confirmation (sms confirm or other transport)."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_dependency "omniauth"
  s.add_dependency "redis"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"

  s.test_files = Dir["spec/**/*"]
end
