source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "mysql2", "~> 0.5"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "devise"
gem "bootstrap"
gem "yt", "~> 0.32.0"
gem "kaminari"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
end

group :development do
  gem "web-console"
  gem "capistrano",     require: false
  gem "capistrano-rvm",   require: false
  gem "capistrano-rails",  require: false
  gem "capistrano-bundler", require: false
  gem "capistrano3-puma",  require: false
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
