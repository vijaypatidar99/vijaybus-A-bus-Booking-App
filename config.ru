# This file is used by Rack-based servers to start the application.

# require_relative "config/environment"
# run Rails.application
# Rails.application.load_server


require_relative './app'

app = Rack::Builder.new do
  use Rack::Logger
  run vijaybus.new
end

run app