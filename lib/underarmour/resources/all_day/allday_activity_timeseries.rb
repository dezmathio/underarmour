module Underarmour
  module AllDay
    class AlldayActivityTimeseries
      
      # https://developer.underarmour.com/docs/v71_All_Day_Activity_Time_Series/

      # item attributes
      attr_accessor :period, :start_datetime, :end_datetime, :summary, :periods
      # collection attributes
      attr_accessor :field_name

      def initialize(json)
        decode_activity_type(json)
      end

      private

      def decode_activity_type(json)
        # @TODO: Implement once we use collections 
        # self.external_id = json['external_id']
        # self.time_series = json['time_series']
        # self.timezones = json['timezones']

        self
      end
    end
  end
end
