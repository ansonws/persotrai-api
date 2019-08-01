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
    :avatar
  ) 

  ############ still need to change when front end implemented #######
  # def avatar
  #   object.avatars_attachments.includes(:blob).map do |attachment|
  #     {
  #       id: attachment.id,
  #       name: attachment.name,
  #       content_type: attachment.blob.content_type,
  #       filename: attachment.blob.filename.to_s,
  #       url: rails_blob_url(attachment)
  #     }
  #   end
  # end
end
