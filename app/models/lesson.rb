class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :trainer
  validates :comment, presence: true

  include AASM

  aasm whiny_transitions: false do
    state :empty, initial: true
    state :requested
    state :approved
    state :declined
    state :payed
    state :finished
    state :done

    event :request do
      transitions from: :empty, to: :requested
    end

    event :approve do
      transitions from: :requested, to: :approved
    end

    event :decline do
      transitions from: :requested, to: :declined
    end

    event :pay do
      transitions from: :approved, to: :payed
    end

    event :finish do
      transitions from: :payed, to: :finished
    end

    event :done do
      transitions from: :finished, to: :done
    end

  end
  
end
