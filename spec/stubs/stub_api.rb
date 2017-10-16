require 'webmock'
include WebMock::API

class String
  def snakecase
    #gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr('-', '_').
    gsub(/\s/, '_').
    gsub(/__+/, '_').
    downcase
  end
end
module Underarmour
  class StubApi
    def self.scoped_api_client(class_name, path, options = {})
      class_name = StubApi.new(class_name, path, options)
    end

    def initialize(class_name, path, options = {})
      @class_name = class_name
      @path = path
      # binding.pry
      # super(options)
    end
    
    #class << self
    def all
      #json = JSON.parse(File.read("./spec/responses/#{json_path_helper}_all.json"))
      json = JSON.parse(File.read("./spec/responses/#{json_path_helper}.json"))

      stub_request(:get, URI.parse("https://api.ua.com/v7.1/#{@path}/"))
        .with(headers: headers)
        .to_return(status: 200, body: json)
    end

    def find_self
      json = JSON.parse(File.read("./spec/responses/#{json_path_helper}_self.json"))

      stub_request(:get, URI.parse("https://api.ua.com/v7.1/#{@path}/self"))
        .with(headers: headers)
        .to_return(status: 200, body: json)
    end

    def find(id = nil)
      json = JSON.parse(File.read("./spec/responses/#{json_path_helper}.json"))

      stub_request(:get, URI.parse("https://api.ua.com/v7.1/#{@path}/#{id}/"))
        .with(headers: headers)
        .to_return(status: 200, body: json)
    end

    def json_path_helper
      demodularized_class_name = @class_name.to_s.split('::').last
      path = "#{demodularized_class_name.snakecase}"
    end

    private

    def headers
      {"Api-Key"=>"client_id_provided_by_ua", "Authorization"=>"Bearer access_token_returned_from_ua", "Content-Type"=>"application/json", "User-Agent"=>"Faraday v0.13.1"}
    end
    #end
  end
end