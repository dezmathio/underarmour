module Underarmour
  class PrivacyOption
    
    # https://developer.underarmour.com/docs/v71_Privacy_Option/

    attr_accessor :links, :embedded, :total_count

    def initialize(json)
      decode_privacy_option(json)
    end

    private

    def decode_privacy_option(json)
      # @TODO: fix this to work with collections
      self.links = json['_links']
      self.embedded = json['_embedded']
      self.total_count = json['total_count']
      self
    end
  end
end
