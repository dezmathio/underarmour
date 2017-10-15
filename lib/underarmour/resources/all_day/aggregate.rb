module Underarmour
  module AllDay
    class Actigraphy
      
      # https://developer.underarmour.com/docs/v71_Aggregate/

      # item attributes
      attr_accessor :period, :start_datetime, :end_datetime, :summary, :periods
      # collection attributes
      attr_accessor :field_name

      def initialize(json)
        decode_activity_type(json)
      end

      private

      def decode_activity_type(json)
        self.period = json['period']
        self.start_datetime = json['start_datetime']
        self.end_datetime = json['end_datetime']
        self.summary = json['summary']
        self.periods = json['periods']
        
        # @TODO: Implement once we use collections 
        # self.field_name = json['field_name']

        self
      end
    end
  end
end
