class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :vin, uniqueness: true

  def rating
    num_trips = self.trips.length
    rating = 0

    num_trips.times do |i|
      rating += self.trips[i].rating
    end

    rating = rating.to_f/num_trips
    return rating.round(2)
  end

  def earned
    num_trips = self.trips.length
    money = 0

    num_trips.times do |i|
      money += (self.trips[i].cost-165) * 0.80
    end

    money = money/100
    return money.round(2)
  end

end
