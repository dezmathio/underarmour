module Underarmour
  module Workout
    class Course
      
      # https://developer.underarmour.com/docs/v71_Course/
      # item attributes
      attr_accessor :distance,:auto_generated,:user_count,:climb_category,:name,:created_datetime,:elevation_diff,:end_index,:grade,:_links,:thumbnail,:start_index,:user_stats
      # collection attributes
      attr_accessor :total_count

      def initialize(json)
        decode_activity_type(json)
      end

      private

      def decode_activity_type(json)
        self.distance = json['distance']
        self.auto_generated = json['auto_generated']
        self.user_count = json['user_count']
        self.climb_category = json['climb_category']
        self.name = json['name']
        self.created_datetime = json['created_datetime']
        self.total_count = json['total_count']
        self.elevation_diff = json['elevation_diff']
        self.end_index = json['end_index']
        self.grade = json['grade']
        self._links = json['_links']
        self.thumbnail = json['thumbnail']
        self.start_index = json['start_index']
        self.user_stats = json['external_id']
        
        # @TODO: Implement once we use collections & other paramters
        # self.total_count = json['total_count']

        self
      end
    end
  end
end
