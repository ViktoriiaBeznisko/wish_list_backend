class WishList < ApplicationRecord
    has_many :wishes, dependent: :delete_all
    belongs_to :user
end
