require "capybara"
require "capybara/cucumber"
require "rspec"
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'
require 'capybara/node/element'
require 'mongo'

Capybara.default_driver = :poltergeist
Capybara.register_driver :poltergeist do |app|
    options = {
        :js_errors => true,
        :timeout => 120,
        :debug => false,
        :phantomjs_options => ['--load-images=no', '--disk-cache=false'],
        :inspector => true,
        :phantomjs_logger => File.open("phantomjs.log", "a")
    }
    Capybara::Poltergeist::Driver.new(app, options)
end

$mappings = {}
$db = Mongo::Client.new([ '127.0.0.1:3002' ], :database => 'test')
