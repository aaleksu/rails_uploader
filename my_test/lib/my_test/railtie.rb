require 'my_test'
require 'rails'

module MyTest
  class Railtie < Rails::Railtie
    railtie_name :my_test

    rake_tasks do
      load 'tasks/my_test_tasks.rake'
    end
  end
end