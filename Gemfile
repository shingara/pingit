source 'https://rubygems.org'

RAILS_VERSION = '>= 3.2.0'

gem 'activesupport', :require => 'active_support'
gem 'actionpack', :require => 'action_pack'
gem 'actionmailer', :require => 'action_mailer'
gem 'railties', :require => 'rails'

gem 'mongoid', :git => 'git@github.com:mongoid/mongoid.git'

gem 'focused_controller', :git => 'git://github.com/jonleighton/focused_controller.git'



# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'mongoid-rspec', :git => 'git://github.com/kfaustino/mongoid-rspec.git', :branch => 'mongoid-3.0'
end
