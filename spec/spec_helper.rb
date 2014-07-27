require 'rspec'
require 'faker'
require 'factory_girl'
require 'active_support'
require 'active_support/dependencies'
relative_load_paths = %w(lib)
ActiveSupport::Dependencies.autoload_paths += relative_load_paths

FactoryGirl.find_definitions

# rspec
RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
