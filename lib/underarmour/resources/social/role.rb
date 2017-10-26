module Underarmour
  module Social
    class Role
          
      # https://developer.underarmour.com/docs/v71_Role/

      attr_accessor :permissions, :description, :name
      
      # collection attributes
      attr_accessor :total_count

      def initialize(json)
        decode_role(json)
      end

      private

      def decode_role(json)
        self.permissions = json['permissions']
        self.description = json['description']
        self.name = json['name']

        # @TODO: Implement once we use collections 
        # self.total_count = json['total_count']
        self
      end
    end
  end
end



