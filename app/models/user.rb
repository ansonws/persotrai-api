class User < ApplicationRecord
    has_one_attached :avatar
    has_secure_password

    has_one :trainer, dependent: :destroy

    has_many :favourites, dependent: :destroy
    has_many :favourited_trainer, through: :favourites, source: :trainer
    
    has_many :trainers, through: :favourites
    

    has_many :reviews, dependent: :nullify

    
    has_many :lessons, dependent: :destroy
   
    validates(:email, presence: true, uniqueness: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)

    def full_name
        "#{first_name} #{last_name}".strip
    end
end
