class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true


  def average_rating
    #self is same thing as driver instance, since we are in model
    sum = 0
    self.trips.each do |trip|
      sum = sum + trip.rating
    end
    length = self.trips.length

    if length == 0
      return 0
    end

    average = sum / length
    return average
  end


  def total_earnings
    total = 0

    if self.trips.length == 0
      return 0
    end
    total_earns = 0
    self.trips.each do |trip|
      total = (trip.cost - 1.65) * 0.8
      total_earns += total
    end
    return (total_earns/100).round(2)
  end


  #method to make the status be available
  # create to find an available driver--assing to a new trip


  def avail_status
    if self.status
      return self.name
    else
      return "no drivers available"
    end
  end


end
