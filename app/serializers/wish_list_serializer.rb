class WishListSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :username, :user_id
  has_many :wishes

  def username
    object.user.username
  end

  def user_id
    object.user.id
  end
  
end
