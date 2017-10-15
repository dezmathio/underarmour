module Underarmour
  module AllDay
    class BodyMass
      
      # https://developer.underarmour.com/docs/v71_BodyMass/
      # item attributes
      attr_accessor :datetime_utc, :datetime_timezone, :created_datetime, :updated_datetime, :external_id, :bmi, :mass, :fat_percent, :lean_mass, :fat_mass
      # collection attributes
      attr_accessor :total_count

      def initialize(json)
        decode_activity_type(json)
      end

      private

      def decode_activity_type(json)
        self.datetime_utc = json['datetime_utc']
        self.datetime_timezone = json['datetime_timezone']
        self.created_datetime = json['created_datetime']
        self.updated_datetime = json['updated_datetime']
        self.external_id = json['external_id']
        self.bmi = json['bmi']
        self.mass = json['mass']
        self.fat_percent = json['fat_percent']
        self.lean_mass = json['lean_mass']
        self.fat_mass = json['fat_mass']

        # @TODO: Implement once we use collections 
        # self.total_count = json['total_count']

        self
      end
    end
  end
end
