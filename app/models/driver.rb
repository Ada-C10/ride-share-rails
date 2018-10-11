class Driver < ApplicationRecord
  has_many :trips
  validates :name, presence: true
  validates :vin, presence: true, uniqueness: true

  # def earnings
  #   drivers_trips = self.all(id: @driver.id)
  #   fee = drivers_trips.length * 1.65 #a fee is subtracted for each trip, multiplied by total trips
  #   gross_earnings = drivers_trips.cost.reduce(:+) - fee
  #   net_earnings = gross_earnings * 0.80 #net is 80% of total
  #
  #   return net_earnings
  # end

  def earnings
    total = 0
    self.trips.each do |trip|
      total += trip.cost - 1.65
    end
    return (total * 0.80).round(2)
  end

  def ratings
    average = 0
    self.trips.each do |trip|
      average += trip.rating.to_f #to float to allow for half ratings
    end

    if trips.length > 0
      rating = average / (self.trips.length)
    else
      rating = 0
    end 

    return rating.round(1) #rounded only one space (4.1, 2.5, etc)
  end
end
