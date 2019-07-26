class Trainer < ApplicationRecord
    has_secure_password

    has_many :sessions, dependent: :destroy

    has_many :favourites, dependent: :destroy
    has_many :favoriters, through: :favourites, source: :user
    has_many :users, through: :favourites

    has_many :reviews, dependent: :destroy
end
