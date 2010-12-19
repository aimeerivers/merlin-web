class User
  include MongoMapper::Document

  many :saved_adventures

  def self.from_engage_token(token)
    req = Net::HTTP.new('rpxnow.com', 443)
    req.use_ssl = true
    http_resp, response_data = req.post("/api/v2/auth_info", "apiKey=#{ENV['ENGAGE_API_KEY']}&token=#{token}")
    self.from_engage_response(JSON.parse(response_data))
  end

  def self.from_engage_response(response)
    user = find_by_identifier(response['profile']['identifier'])
    return user unless user.nil?
    create(response['profile'])
  end

  def name
    preferredUsername
  end

end
