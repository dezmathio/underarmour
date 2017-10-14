module Underarmour
  module User
    class UserRole
      
      # https://developer.underarmour.com/docs/v71_User_Profile_Photo/

      attr_accessor :desc, :total_count

      def initialize(json)
        decode_user_profile_photo(json)
      end

      private

      def decode_user_profile_photo(json)
        self.small = json['small']
        self.large = json['large']
        self.self = json['self'] # not sure if this is necessary really
        self.medium = json['medium']
        self.documentation = json['documentation']
        self
      end
    end
  end
end
