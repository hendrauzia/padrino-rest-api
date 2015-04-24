RACK_ENV = 'test' unless defined?(RACK_ENV)

require 'airborne'
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

Dir[File.expand_path(File.dirname(__FILE__) + "/support/**/*.rb")].each(&method(:require))

Airborne.configure do |config|
  config.rack_app = Padrino.application
end

Api.before do
  require File.expand_path(Padrino.root + "/config/initializers/rabl.rb")
  env['api.tilt.root'] = File.join(Padrino.root, "/app/views")
end
