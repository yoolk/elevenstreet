require 'httparty'
require 'active_support/core_ext/hash'

require 'elevenstreet/api/auth'
require 'elevenstreet/api/product'
require 'elevenstreet/api/category'

module Elevenstreet
  class Client
    include HTTParty
    include Elevenstreet::API::Auth
    include Elevenstreet::API::Product
    include Elevenstreet::API::Category

    base_uri 'api.11street.my/rest'

    def initialize(api_key = nil, options = {})
      raise ArgumentError, 'API Key is required.' if api_key.nil?

      @api_key = api_key
    end

    def headers
      {
        'openapikey' => @api_key,
        'Content-Type' => 'application/xml',
        'Accept-Charset' => 'utf8'
      }
    end

  end
end
