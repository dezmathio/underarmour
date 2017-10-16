module Underarmour
  class ApiClient < BaseClient

    # Kinda weird right now since you have to call it like this... @TODO: see if I can alias some of these class names to shorten these calls
    # user = Underarmour::ApiClient.scoped_api_client(Underarmour::User, 'user/', access_token: access_token, api_key: api_key)
    def self.scoped_api_client(class_name, path, options = {})
      class_name = ApiClient.new(class_name, path, options)
    end

    # USER_ENDPOINTS = %w(user privacy_option user_profile_photo user_role user_stats)
    # SOCIAL_ENDPOINTS = %w(activity_story friendship moderation_action moderation_action_type moderation_status page page_association page_follow page_type role friend_suggestion)
    # WORKOUT_ENDPOINTS = %w(course data_source data_source_priority device gear heart_rate_zones heart_rate_zone_calculation map_marker_image remoteconnection remoteconnectiontype route route_bookmark user_achievement usergear workout workout_heart_rate)
    # 24_7_ENDPOINTS = %w(actigraphy activity_type aggregate allday_activity_timeseries allday_activity body_mass sleep)
    # CONTENT_ENDPOINTS = %w(image webhook)

    def initialize(class_name, path, options = {})
      @class_name = class_name
      @path = path
      super(options)
    end

    def all
      [].tap do |f|
        response = get("#{@path}/")
        response_user = JSONConverter.to_hash(response.body)
        response_user.each do |resource|
          f << @class_name.new(resource)
        end
      end
    end

    def find(id = nil)
      response = get("#{@path}/#{id}")
      binding.pry
      hash = JSONConverter.to_hash(response.body)
      @class_name.new(hash)
    end

    def find_self
      response = get("#{@path}/self")
      hash = JSONConverter.to_hash(response.body)
      @class_name.new(hash)
    end
  end
end
