source 'http://rubygems.org'

decko_gem_path = "./vendor/decko"

path decko_gem_path do
  gem "card", require: false
  gem "cardname", require: false
  gem "decko"
end

gem 'mysql2', '< 0.5'
gem 'dalli'

gem "newrelic_rpm"
gem "card-mod-new_relic", path: "./vendor/card-mods/new_relic"

group :development do
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "pry-rescue"
  gem "pry-stack_explorer"
  gem "thin"

  gem "capistrano"
  gem "capistrano-bundler"
  gem 'capistrano-git-with-submodules', '~> 2.0'
  #gem "capistrano-maintenance", require: false
  gem "capistrano-passenger"
  gem "capistrano-rvm"
end

Dir.glob( 'mod/**{,/*/**}/Gemfile' ).each do |gemfile|
  instance_eval File.read(gemfile)
end

