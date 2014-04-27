$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "my_test/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "my_test"
  s.version     = MyTest::VERSION
  s.authors     = ["my test gem"]
  s.email       = ["a.aleksu@gmail.com"]
  s.homepage    = "http://forfundev.com"
  s.summary     = "my test gem"
  s.description = "my test gem"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.4"
  s.add_dependency 'rmagick'
end
