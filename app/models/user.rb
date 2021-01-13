class User < ApplicationRecord
    validates :username, presence: true, uniqueness: { message: "This name is taken, please choose another name or Login" }
    
    has_secure_password
    has_many :wish_lists  
    has_many :wishes, through: :wish_list

  end