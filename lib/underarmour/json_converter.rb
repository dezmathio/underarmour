class JSONConverter
  def self.to_hash(json)
    return JSON.parse(json) if json.class == String
    json
  end
end