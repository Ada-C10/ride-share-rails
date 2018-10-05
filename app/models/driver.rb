class Driver < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :vin, uniqueness: true

  def rating
    num_trips = self.trips.length
    ongoing_trips = 0
    rating = 0

    num_trips.times do |i|
      if self.trips[i].rating != nil
        rating += self.trips[i].rating
      else
        ongoing_trips += 1
      end
    end

    rating = rating.to_f/(num_trips-ongoing_trips)
    return rating.round(2)
  end

  def earned
    num_trips = self.trips.length
    money = 0

    num_trips.times do |i|
      if self.trips[i].cost != nil
        money += (self.trips[i].cost-165) * 0.80
      end
    end

    money = money/100
    return money.round(2)
  end

end
