# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in essence.gemspec.
gemspec

gem 'puma'

gem 'sqlite3'

gem 'propshaft'

# Start debugger with binding.b [https://github.com/ruby/debug]
# gem "debug", ">= 1.0.0"

gem 'lookbook'

group :development, :test do
  gem 'rspec-rails'
end

group :development do
  gem 'rubocop',       require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'brakeman'

  gem 'capybara'
  gem 'selenium-webdriver'

  gem 'rspec-github', require: false
end
