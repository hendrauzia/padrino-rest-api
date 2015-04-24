#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

run Padrino.application

Dir[File.expand_path(File.dirname(__FILE__) + "/config/initializers/**/*.rb")].each(&method(:require))

use Rack::Config do |env|
  env['api.tilt.root'] = File.join(Padrino.root, "/app/views")
end

