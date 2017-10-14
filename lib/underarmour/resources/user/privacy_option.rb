module Underarmour
  module User
    class PrivacyOption
      
      # https://developer.underarmour.com/docs/v71_Privacy_Option/

      attr_accessor :desc, :total_count

      def initialize(json)
        decode_privacy_option(json)
      end

      private

      def decode_privacy_option(json)
        self.desc = json['desc']
        self.total_count = json['total_count']
        self
      end
    end
  end
end
