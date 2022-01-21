source 'http://rubygems.org'

if ENV["RM_INFO"] && ARGV[0] == 'check'
  puts "Execution in RubyMine detected in Gemfile. Ignoring decko gem path"
  # This causes Rubymine and IntelliJ to handle these paths as normal sources rather
  # than gems or libraries.
  # That way the files are included as normal project sources in Find and Open.
else
  gem "decko", path: "./vendor/decko"
  # CARD MODS
  # The easiest way to change card behaviors is with card mods. To install a mod:
  #
  #   1. add the gem below
  #   2. run `bundle update` to install the code
  #   3. run `decko update` to make any needed changes to your deck
  #
  # The "defaults" includes a lot of functionality that is needed in standard decks.
  path "./vendor/decko/mod" do
    gem "card-mod-defaults"
    gem "card-mod-delayed_job"
    gem "card-mod-monkey", group: :development
  end

  gem "card-mod-new_relic", path: "./vendor/card-mods"
  gem "decko-cap", path: "./vendor/decko-cap"

  # MONKEYS
  # You can also create your own mods. Mod developers (or "Monkeys") will want some
  # additional gems to support development and testing.

  # gem "decko-rspec", group: :test
  # gem "decko-cucumber", group: :test
  # gem "decko-profile", group: :profile
  # gem "decko-cypress", group: %i[cypress test]
  # gem "decko-spring", group: %i[test development]
end

gem "mysql2", "> 0.4"
gem "dalli", group: :production
gem "yard"


# The following allows simple (non-gem) mods to specify gems via a Gemfile.
# You may need to alter this code if you move such mods to an unconventional location.
# Dir.glob("mod/**/Gemfile").each { |gemfile| instance_eval File.read(gemfile) }
