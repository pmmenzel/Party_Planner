source 'https://rubygems.org'

ruby '2.4.1'


gem 'dotenv-rails', :groups => [:development, :test]

gem 'rails', '4.2.8'

# use this version until they fix the constant erros on pg 0.21
gem 'pg', '0.21'

gem 'activerecord-session_store'

gem 'sass-rails', '~> 4.0.3'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails', '4.3.1'
gem 'jquery-ui-rails', '6.0.1'

gem 'turbolinks'

gem 'jbuilder', '~> 2.0'

gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'devise'

gem 'domp'

gem 'rubocop', require: false

# gem 'rolify'
# gem 'cancancan', '~> 1.10'
gem 'action_access'

gem "omniauth"
gem "omniauth-google-oauth2"
gem "omniauth-facebook"
gem 'foundation-rails'

gem 'haml-rails', '~> 1.0'

gem 'actionmailer-with-request' # Gives ActionMailer access to routes
gem 'httparty' # Integrations

# group :development do
#   gem 'spring'
#   gem 'spring-commands-rspec'
#   gem 'spring-watcher-listen'
# end


group :development, :test do
  gem 'rspec-rails', '~> 3.6.0'
  gem 'rspec-retry'
  gem 'awesome_print'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'parallel_tests'
  gem 'bullet'
  gem 'pry-byebug'
  gem 'better_errors' # Adds /__better_errors
  gem 'meta_request' # Required for /__better_errors
  gem 'binding_of_caller'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'shoulda-matchers'#, require: false
  gem 'database_cleaner'
  gem 'webmock'
  gem 'simplecov', require: false
  gem 'poltergeist'
end

