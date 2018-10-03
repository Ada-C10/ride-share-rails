class Passenger < ApplicationRecord
  # QUESTION: BETTER TO NULLIFY OR DELETE??
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :phone_num, presence: true
end
