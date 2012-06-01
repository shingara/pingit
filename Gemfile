source 'https://rubygems.org'

RAILS_VERSION = '>= 3.2.0'

gem 'activesupport', :require => 'active_support'
gem 'actionpack', :require => 'action_pack'
gem 'actionmailer', :require => 'action_mailer'
gem 'railties', :require => 'rails'

gem 'mongoid', :git => 'git://github.com/mongoid/mongoid.git'

gem 'sidekiq'
gem 'sinatra'
gem 'faraday'
gem 'draper'
gem 'kaminari', :git => 'git://github.com/amatsuda/kaminari.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem "twitter-bootstrap-rails"

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platform => :ruby
  gem 'therubyrhino', :platform => :jruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'slim-rails'
gem 'simple_form'

group :development, :test do
  gem 'quiet_assets'
  gem 'rspec-rails'
  gem 'guard'
  gem 'guard-rspec'
  gem 'vagrant'
end

group :test do
  gem 'mongoid-rspec', :git => 'git://github.com/evansagge/mongoid-rspec.git'
  gem 'capybara'
  gem 'fabrication'
end

## Deployment
gem 'unicorn'

group :scheduler do
  gem 'dante'
  gem 'rufus-scheduler'
end
