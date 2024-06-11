class ApiUser
  attr_reader :id,
              :name,
              :email,
              :api_key
  
  def initialize(data)
    @id      = data.id
    @name    = data.name
    @email   = data.email 
    @api_key = data[:api_pwd]
  end
end