module Underarmour
  module User
    class UserStats
      
      # https://developer.underarmour.com/docs/v71_User_Stats/

      attr_accessor :aggregate_period, :activity_count, :distance, :duration, :energy, :avg_pace, :avg_speed, :time_in_heart_rate_zones

      def initialize(json)
        decode_user_stats(json)
      end

      private

      def decode_user_stats(json)
        self.aggregate_period = json['aggregate_period']
        self.activity_count = json['activity_count']
        self.distance = json['distance']
        self.duration = json['duration']
        self.energy = json['energy']
        self.avg_pace = json['avg_pace']
        self.avg_speed = json['avg_speed']
        self.time_in_heart_rate_zones = json['time_in_heart_rate_zones']
        self
      end
    end
  end
end
