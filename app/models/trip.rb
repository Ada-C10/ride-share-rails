class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :rating, presence: true, length: { in: 1..5 }


end
