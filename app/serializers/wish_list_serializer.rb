class WishListSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :user_id
  has_many :wishes


  def user_id
    object.user.id
  end
  

end
