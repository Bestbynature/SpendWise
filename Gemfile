source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.6'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

# My gems
gem 'devise'

gem 'rubocop', '>= 1.0', '< 2.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'database_cleaner'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rails-controller-testing'
  gem 'rspec-mocks', '3.12.6'
  gem 'rspec-rails'
  gem 'selenium-webdriver', '~> 4.0'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'shoulda-matchers'
end

gem 'rufo', '~> 0.16.2'
