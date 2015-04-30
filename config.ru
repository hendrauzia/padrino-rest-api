#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require 'grape-active_model_serializers'
require File.expand_path("../config/boot.rb", __FILE__)

run Padrino.application
