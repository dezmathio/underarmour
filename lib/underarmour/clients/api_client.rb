module Underarmour
  class ApiClient < BaseClient
    def initialize(options = {})
      super(options)
    end

    def all
      [].tap do |f|
        response = get('user/')
        response_user = JSONConverter.to_hash(response.body)
        response_user.each do |user|
          f << User.new(user)
        end
      end
    end

    def find(id)
      response = get("user/#{id}")
      User.new(response.body)
    end
  end
end
