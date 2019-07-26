class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :trainer
  validates :comment, presence: true
end
