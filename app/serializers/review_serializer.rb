class ReviewSerializer < ActiveModel::Serializer
  attributes (
    :id,
    :body,
    :rating,
    :created_at, 
    :updated_at
  )

  belongs_to(:user, key: :user)
  belongs_to(:trainer, key: :trainer)
end
