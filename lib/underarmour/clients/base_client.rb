require 'faraday_middleware'

module Underarmour
  class BaseClient
    def initialize(options = {})
      @access_token = options[:access_token]
    end

    def post(path, _headers = {})
      connection.post(path)
    end

    def get(path, _headers = {})
      connection.get(path)
    end

    private

    def headers
      {
        Authorization: "Bearer #{@access_token}",
        'Content-Type' => 'application/json'
      }
    end

    def connection
      Faraday.new(url: Config.base_url, headers: headers) do |builder|
        builder.request :json
        builder.adapter :net_http
      end
    end
  end
end