module Underarmour
  module User
  class PrivacyOption
    attr_accessor :desc, :total_count

    def initialize(json)
      decode_privacy_option(json)
    end

    private

    def decode_privacy_option(json)
      self.desc = json['desc']
      # ...
      self
    end
  end
end
