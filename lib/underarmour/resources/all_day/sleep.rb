module Underarmour
  module AllDay
    class Sleep
      
      # https://developer.underarmour.com/docs/v71_Sleep/
      # item attributes
      attr_accessor :start_datetime_utc, :end_datetime_utc, :created_datetime, :updated_datetime, :external_id, :has_time_series, :time_series, :timezones, :aggregates
      # collection attributes
      attr_accessor :total_count

      def initialize(json)
        decode_activity_type(json)
      end

      private

      def decode_activity_type(json)
        self.start_datetime_utc = json['start_datetime_utc']
        self.end_datetime_utc = json['end_datetime_utc']
        self.datetime_timezone = json['datetime_timezone']
        self.created_datetime = json['created_datetime']
        self.updated_datetime = json['updated_datetime']
        self.external_id = json['external_id']
        self.has_time_series = json['has_time_series']
        self.time_series = json['time_series']
        self.timezones = json['timezones']
        self.aggregates = json['aggregates']

        ## agg details
        # self.aggregates.details.deep_sleep = json['aggregates.details.deep_sleep']
        # self.aggregates.details.light_sleep = json['aggregates.details.light_sleep']
        # self.aggregates.details.awake = json['aggregates.details.awake']
        # self.aggregates.details.times_awakened = json['aggregates.details.times_awakened']
        # self.aggregates.details.times_to_sleep = json['aggregates.details.times_to_sleep']

        # @TODO: Implement once we use collections 
        # self.total_count = json['total_count']

        self
      end
    end
  end
end
