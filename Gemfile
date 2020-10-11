source 'http://rubygems.org'

gem "decko", path: "./vendor/decko"

gem 'mysql2', '< 0.5'

# why do we need all these?
gem 'sprockets', '~>3.0'
gem "ed25519", "~>1.2"
gem "bcrypt_pbkdf", "~>1.0"


group :production do
  gem 'dalli'
end

# CARD MODS
# The easiest way to change card behaviors is with card mods. To install a mod:
#
#   1. add the gem below
#   2. run `bundle update` to install the code
#   3. run `decko update` to make any needed changes to your deck
#
# The "defaults" includes a lot of functionality that is needed in standard decks.
gem "card-mod-defaults"
gem "card-mod-delayed_job"

gem "card-mod-new_relic", path: "./vendor/card-mods"
gem "decko-cap", path: "./vendor/decko-cap"

# MONKEYS
# You can also create your own mods. Mod developers (or "Monkeys") will want some
# additional gems to support development and testing.
gem "card-mod-monkey", group: :development
gem "decko-rspec", group: :test
gem "decko-cucumber", group: :test
gem "decko-profile", group: :profile
gem "decko-cypress", group: %i[cypress test]
gem "decko-spring", group: %i[test development]

group :development do
  gem "capistrano"
  gem "capistrano-bundler"
  gem 'capistrano-git-with-submodules', '~> 2.0'
  #gem "capistrano-maintenance", require: false
  gem "capistrano-passenger"
  gem "capistrano-rvm"
end

# The following allows simple (non-gem) mods to specify gems via a Gemfile.
# You may need to alter this code if you move such mods to an unconventional location.
Dir.glob("mod/**/Gemfile").each { |gemfile| instance_eval File.read(gemfile) }
