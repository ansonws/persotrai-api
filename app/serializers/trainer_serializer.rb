class TrainerSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :price,
    :area,
    :description,
    :created_at, 
    :updated_at,
  )

  belongs_to(:user, serializer: UserSerializer)


  has_many(:favourites)
  has_many(:reviews)
  has_many(:lessons)
end
