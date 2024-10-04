# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in beyond_essence.gemspec.
gemspec

gem 'puma'

gem 'sqlite3'

gem 'sprockets-rails'

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

gem 'lookbook'

gem 'rubocop',       require: false
gem 'rubocop-rails', require: false

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
