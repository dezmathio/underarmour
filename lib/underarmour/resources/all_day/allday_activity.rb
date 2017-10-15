module Underarmour
  module AllDay
    class AlldayActivity
      
      # https://developer.underarmour.com/docs/v71_All_Day_Activity/
      # item attributes
      attr_accessor :start_datetime_utc, :end_datetime_utc, :created_datetime, :updated_datetime, :user, :has_time_series, :external_id, :time_series, :aggregates, :timezones
      # collection attributes
      attr_accessor :total_count

      def initialize(json)
        decode_activity_type(json)
      end

      private

      def decode_activity_type(json)
        self.start_datetime_utc = json['start_datetime_utc']
        self.end_datetime_utc = json['end_datetime_utc']
        self.created_datetime = json['created_datetime']
        self.updated_datetime = json['updated_datetime']
        self.user = json['user']
        self.has_time_series = json['has_time_series']
        self.external_id = json['external_id']
        self.time_series = json['time_series']
        self.aggregates = json['aggregates']

        # aggregates attributes
        # self.aggregates.total_steps = json['aggregates.total_steps']
        # self.aggregates.total_energy_expended = json['aggregates.total_energy_expended']
        # self.aggregates.total_distance = json['aggregates.total_distance']
        # self.aggregates.total_active_time = json['aggregates.total_active_time']
        self.timezones = json['timezones']

        # @TODO: Implement once we use collections 
        # self.total_count = json['total_count']

        self
      end
    end
  end
end
