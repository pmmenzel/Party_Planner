if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start 'rails' do
    nocov_token 'nocov'
  end
end
require 'spec_helper'

# require 'rubygems'
# require 'database_cleaner'
# require 'base64'
ENV['RAILS_ENV'] ||= 'test'

# This file is copied to spec/ when you run 'rails generate rspec:install'
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.include Warden::Test::Helpers
  config.include Devise::TestHelpers, type: :controller
  config.include ControllersSpecHelper, type: :controller
  config.include FactoryGirl::Syntax::Methods

  # use delayed job for testing
  config.around(:each, :delayed_job) do |example|
    old_value = Delayed::Worker.delay_jobs
    Delayed::Worker.delay_jobs = true
    Delayed::Job.destroy_all

    example.run

    Delayed::Worker.delay_jobs = old_value
  end
end
