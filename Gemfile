source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bcrypt'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'carrierwave'
gem 'fast_jsonapi'
gem 'ffaker', '~> 2.14.0'
gem 'jwt'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'rack-cors'
gem 'rails', '~> 6.0.3'
gem 'reform', '2.2.4'
gem 'reform-rails', '0.1.7'
gem 'simple_endpoint'
gem 'trailblazer-rails', '2.1.7'

group :development, :test do
  gem 'pry-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'json-schema'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.6'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
