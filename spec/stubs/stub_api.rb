require 'webmock'
include WebMock::API

module StubApi
  class User
    class << self
      def find
        json = JSON.parse(File.read('./spec/responses/user_find_self.json'))

        stub_request(:get, 'http://api.ua.com/v7.1/user/1')
          .with(headers: headers)
          .to_return(status: 200, body: json)
      end

      private

      def headers
        {}
      end
    end
  end
end