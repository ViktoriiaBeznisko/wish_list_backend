class WishListSerializer < ActiveModel::Serializer
  attributes :id, name, url, username
  has_many :wishes

  def username
    object.user.username
  end
  
end
