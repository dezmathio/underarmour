module Underarmour
  module User
    class UserRole
      
      # https://developer.underarmour.com/docs/v71_User_Profile_Photo/

      attr_accessor :role

      def initialize(json)
        decode_user_role(json)
      end

      private

      def decode_user_role(json)
        self.resource = json['resource']
        self.role = json['role']
        self.user = json['user']
        self
      end
    end
  end
end
