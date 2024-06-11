class Api::V1::SessionsController < ApplicationController
 def create 
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    api_user = UserFacade.create_api_user(user)
    render json: UserSerializer.new(api_user), status: :ok
  else 
    render json: { error: 'Invalid email or password' }, status: :unauthorized
  end
 end
end