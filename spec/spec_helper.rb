RACK_ENV = 'test' unless defined?(RACK_ENV)

require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))
Dir[File.expand_path(File.dirname(__FILE__) + "/support/**/*.rb")].each(&method(:require))

unless __FILE__.include?('api')
  RSpec.configure do |config|
    config.include Rack::Test::Methods
  end

  # You can use this method to custom specify a Rack app
  # you want rack-test to invoke:
  #
  #   app PadrinoRestApi::App
  #   app PadrinoRestApi::App.tap { |a| }
  #   app(PadrinoRestApi::App) do
  #     set :foo, :bar
  #   end
  #

  def app(app = nil, &blk)
    @app ||= block_given? ? app.instance_eval(&blk) : app
    @app ||= Padrino.application
  end
end
