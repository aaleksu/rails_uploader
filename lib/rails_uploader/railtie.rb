require 'rails_uploader'
require 'rails'

module MyTest
  class Railtie < Rails::Railtie
    railtie_name :rails_uploader

    rake_tasks do
      load 'tasks/rails_uploader_tasks.rake'
    end
  end
end