module Underarmour
  module AllDay
    class Actigraphy
      
      # https://developer.underarmour.com/docs/v71_Actigraphy/

      # item attributes
      attr_accessor :date, :start_datetime_utc, :end_datetime_utc, :timezones, :aggregates, :metrics, :workouts
      # collection attributes
      attr_accessor :total_count, :oldest_date

      def initialize(json)
        decode_activity_type(json)
      end

      private

      def decode_activity_type(json)
        self.date = json['date']
        self.start_datetime_utc = json['start_datetime_utc']
        self.end_datetime_utc = json['end_datetime_utc']
        self.timezones = json['timezones']
        self.aggregates = json['aggregates']
        self.metrics = json['metrics']
        self.workouts = json['workouts']
        
        # @TODO: Implement once we use collections 
        # collection attrs
        # self.total_count = json['total_count']
        # self.total_count = json['total_count']

        self
      end
    end
  end
end
