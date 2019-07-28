class TrainerCollectionSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :price,
    :area,
    :description
  )

  belongs_to :user
end
