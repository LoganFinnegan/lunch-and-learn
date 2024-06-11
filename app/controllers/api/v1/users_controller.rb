class Api::V1::UsersController < ApplicationController
  def create
    begin 
      user = User.create!(user_params)

      api_user = UserFacade.create_api_user(user)
      render json: UserSerializer.new(api_user), status: :created
    rescue ActiveRecord::RecordInvalid => e 
      render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 
  
  def user_params
    params[:api_pwd] = User.generate_api_key
    params.permit(:name, :email, :password, :password_confirmation, :api_pwd)
  end
end


