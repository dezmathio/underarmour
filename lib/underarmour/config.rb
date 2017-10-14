module Config
  class << self
    def base_url
      ENV['BASE_URL'] ? ENV['BASE_URL'] : 'https://api.ua.com/v7.1/'
    end
  end
end