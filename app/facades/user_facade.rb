class UserFacade 
  def self.create_api_user(user)
    ApiUser.new(user)
  end
end