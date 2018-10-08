class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver
  validates :passenger, presence: true
  validates :driver, presence: true
  validates_inclusion_of :rating, in: (1..5), allow_nil: true

  self.per_page = 10
end
