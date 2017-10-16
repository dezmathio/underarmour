module Underarmour
  class ActivityType
    
    # https://developer.underarmour.com/docs/v71_Activity_Type/

    attr_accessor :import_only, :location_aware, :name, :mets, :mets_speed, :short_name, :has_children, :template, :links

    def initialize(json)
      decode_activity_type(json)
    end

    private

    def decode_activity_type(json)
      # doing this:
      # json['_embedded'].first.last.count
      # reveals there are 841 activity_types in the response

      self.mets = json['mets']
      self.mets_speed = json['mets_speed']
      self.name = json['name']
      self.short_name = json['short_name']
      self.has_children = json['has_children']
      self.import_only = json['import_only']
      self.location_aware = json['location_aware']
      self.links = json['_links']
      # within links weve got %w(icon_url self documentation root parent)
      self.template = json['template']
      self
    end
  end
end
