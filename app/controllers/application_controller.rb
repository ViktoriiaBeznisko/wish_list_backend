class ApplicationController < ActionController::API

    def encode_token(user_id)
      JWT.encode({user_id: user_id}, ENV["JWT_KEY"])
    end
  
    def user_token
      request.headers["Authorization"]
    end
  
    def decode_token
      JWT.decode(user_token, ENV["JWT_KEY"])
    end
  
    def logged_in_user
      # binding.pry
      User.find_by_id(decode_token[0]["user_id"])
    end

    # def current_users
    #   User.find_by(id:session[:user_id])
    # end

    helper_method :logged_in_user
 
  end
   
  
 