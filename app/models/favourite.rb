class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :trainer

  validates :trainer_id, uniqueness: { scope: :user_id }
end
