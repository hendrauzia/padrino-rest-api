RACK_ENV = 'test' unless defined?(RACK_ENV)

require 'airborne'
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

Dir[File.expand_path(File.dirname(__FILE__) + "/support/**/*.rb")].each(&method(:require))

Airborne.configure do |config|
  config.rack_app = Padrino.application
end
