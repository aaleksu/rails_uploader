require 'fileutils'

namespace :rails_uploader do
  desc "Gem initialization"
  task :init do
    rails_root = Rails.root
    gem_root = File.dirname(__FILE__)
    path_to_config = File.join('config', 'initializers', 'rails_uploader.rb')
    gem_config = File.join(gem_root, '..', '..', path_to_config)
    app_gem_config_path = File.join(rails_root, path_to_config)

    if File.exists?(gem_config) && !File.exists?(app_gem_config_path)
      begin
        FileUtils.copy(gem_config, app_gem_config_path)
        puts "rails_uploader config has been copied into config/initializers/ dir"
      rescue Exception => e
        puts e.message
      end
    end
  end
end