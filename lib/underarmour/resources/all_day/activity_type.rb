module Underarmour
  module AllDay
    class ActivityType
      
      # https://developer.underarmour.com/docs/v71_Activity_Type/

      attr_accessor :import_only, :location_aware, :name, :mets, :mets_speed, :short_name, :has_children, :template

      def initialize(json)
        decode_activity_type(json)
      end

      private

      def decode_activity_type(json)
        self.import_only = json['import_only']
        self.location_aware = json['location_aware']
        self.name = json['name']
        self.mets = json['mets']
        self.mets_speed = json['mets_speed']
        self.short_name = json['short_name']
        self.has_children = json['has_children']
        self.template = json['template']
        self
      end
    end
  end
end
