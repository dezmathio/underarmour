require 'webmock'
include WebMock::API


module StubApi
  class User
    class << self
      def find_self
        json = JSON.parse(File.read('./spec/responses/user_self.json'))

        stub_request(:get, URI.parse('https://api.ua.com/v7.1/user/self'))
          .with(headers: headers)
          .to_return(status: 200, body: json)
      end

      private

      def headers
        {"Api-Key"=>"client_id_provided_by_ua", "Authorization"=>"Bearer access_token_returned_from_ua", "Content-Type"=>"application/json", "User-Agent"=>"Faraday v0.13.1"}
      end
    end
  end
end