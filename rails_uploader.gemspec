$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_uploader/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_uploader"
  s.version     = RailsUploader::VERSION
  s.authors     = ["Alex Anisimov"]
  s.email       = ["a.aleksu@gmail.com"]
  s.homepage    = "https://github.com/aaleksu/rails_uploader"
  s.summary     = "Ruby gem for file uploading on Rails project"
  s.description = "Implements general logic of file uploading"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  #s.add_dependency "rails", "~> 4.0.4"
  s.add_dependency 'rmagick'
end
