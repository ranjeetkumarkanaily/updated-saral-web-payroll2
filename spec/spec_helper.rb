require 'simplecov'
SimpleCov.start 'rails'
require 'rubygems'
require 'spork'


Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'paperclip/matchers'


  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    #config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false

    # for database cleaner -- start --
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation, {:except => %w[salary_heads leave_opening_balance]}
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
     DatabaseCleaner.start
    end

    config.after(:each) do
      #DatabaseCleaner.clean
    end

    # for database cleaner -- end --

    config.include Paperclip::Shoulda::Matchers
    config.gem "breadcrumbs_on_rails"
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  require 'factory_girl_rails'
  require 'breadcrumbs_on_rails'
end

# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading
#   code that you don't normally modify during development in the
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#
