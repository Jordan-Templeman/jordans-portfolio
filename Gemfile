# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
gem 'react_on_rails', '12.4.0'
gem 'sass-rails', '>= 6'
gem 'sqlite3', '~> 1.4'
gem 'vite_rails', '~> 3.0.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'faker', '~> 2.17.0'
  gem 'rspec-rails', '~> 5.0.0'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'airborne', '0.3.7'
  gem 'capybara', '3.35.3'
  gem 'shoulda-matchers', '~> 5.0'
  gem 'webdrivers', '5.0.0', require: false
end

gem 'mini_racer', platforms: :ruby
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
