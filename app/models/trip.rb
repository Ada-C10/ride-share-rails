class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  validates :date, presence: true
  validates :rating, numericality: {only_integer: true, less_than_or_equal_to: 5, greater_than: 0}, allow_nil: true
  validates :cost, numericality: {only_integer: true}, allow_nil: true

end
