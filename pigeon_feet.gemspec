$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "pigeon_feet/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "pigeon_feet"
  s.version     = PigeonFeet::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PigeonFeet."
  s.description = "TODO: Description of PigeonFeet."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0.beta2"
  s.add_dependency "coffee-rails", "~> 4.0.1"
end
