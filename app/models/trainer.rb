class Trainer < ApplicationRecord
    has_secure_password
    belongs_to :user

    has_many :lessons, dependent: :destroy

    has_many :favourites, dependent: :destroy
    has_many :favoriters, through: :favourites, source: :user
    has_many :users, through: :favourites

    has_many :reviews, dependent: :destroy
end
