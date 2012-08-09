if defined?(Konacha)
  require "capybara/poltergeist"
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new app, :phantomjs => "/usr/local/phantomjs-1.6.1-linux-i686-dynamic/bin/phantomjs"
  end
  Konacha.configure do |config|
    config.spec_dir  = "spec/javascripts"
    config.driver    = :poltergeist
  end
end
