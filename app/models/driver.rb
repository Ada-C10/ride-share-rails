class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true, format: {with: /\A[a-zA-Z\.\'\-]{2,50}(?: [a-zA-Z\.\'\-]{2,50})+\Z/}
  validates :vin, presence: true, format: {with: /[A-HJ-NPR-Z0-9]/i}, length: { is: 17 }
end
