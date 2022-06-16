class ApplicationController < ActionController::Base
  require 'hubspot-api-client'

  Hubspot.configure do |config|
    config.api_key['hapikey'] = "SET_API_KEY"
  end
end
