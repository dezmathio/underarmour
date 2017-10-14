module Underarmour
  class User
    attr_accessor :date_joined, :first_name, :gender, :last_initial, :last_login, :location, :locality,
                  :region, :country, :time_zone, :username, :preferred_language

    # auth properties
    attr_accessor :birthdate, :email, :communication, :newsletter, :promotions, :system_messages,
                  :display_measurement_system, :last_name, :location, :address, :sharing, :facebook, :twitter, :height, :weight

    # auth properties when they are friends with authed user
    attr_accessor :goal_statement, :hobbies, :introduction, :last_name

    def initialize(json)
      decode_user(json)
    end

    private

    def decode_user(json)
      self.first_name = json['first_name']
      # ...
      self
    end
  end
end
