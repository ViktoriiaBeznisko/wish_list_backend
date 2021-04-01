class UsersController < ApplicationController

    def create
      user = User.create(user_params)
      token = encode_token(user.id)
      if user.save
         render json: {user: user, token: token}
      else
         render json: user.errors, status: :unprocessable_entry
      end
    end
  
    private
  
    def user_params
      params.permit(:username, :password)
      # params.require(:user).permit(:username, :password)
    end
  
  end