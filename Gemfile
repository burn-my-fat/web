# frozen_string_literal: true

source 'https://rubygems.org'

gem 'hanami', '~> 1.2'
gem 'hanami-model', '~> 1.2'
gem 'rake'

gem 'pg'

gem 'slim'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'hanami-webconsole'
  gem 'shotgun', platforms: :ruby
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
end

group :test do
  gem 'bundler-audit', require: false
  gem 'capybara'
  gem 'database_cleaner'
  gem 'rspec'
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
end

group :production do
  # gem 'puma'
end
