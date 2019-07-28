class FavouriteSerializer < ActiveModel::Serializer
  attributes (
    :id,
    :created_at, 
    :updated_at
  )

  belongs_to(:user, key: :user)
  belongs_to(:trainer, key: :trainer)
end
