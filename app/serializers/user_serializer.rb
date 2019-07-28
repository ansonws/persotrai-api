class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes(
    :id,
    :first_name,
    :last_name,
    :email,
    :full_name,
    :updated_at,
    :created_at,
  ) 
end
