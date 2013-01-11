if 'development' == ENV['RAILS_ENV']
  source 'http://ruby.taobao.org'
else
  source 'https://rubygems.org'
end

gem 'rails', '3.2.11'

gem 'mysql2'
gem 'unicorn'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails'
gem 'rails_admin'
gem 'bootstrap-will_paginate'
gem "devise"
gem 'newrelic_rpm'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :test do
  gem 'rspec-rails'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
end

group :development do
  gem 'capistrano', :require => false
  gem 'therubyracer', '0.10.2', :platforms => :ruby
  gem 'rvm-capistrano'
end

