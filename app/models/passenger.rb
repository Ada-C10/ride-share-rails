class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true


  def total_amt_paid
    sum = 0
    self.trips.each do |trip|

    end
    return sum
  end

  def average_rating
    ratings = 0
    self.trips.each do |trip|

    end
    return
  end
end
