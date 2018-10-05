class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true


  def average_rating
    #self is same thing as driver instance, since we are in model
    sum = 0
    self.trips.each do |trip|
      unless trip.rating == nil
        sum = sum + trip.rating
      end
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


  def self.avail_status
    avail = Driver.where(status: true)
    #fix syntax
    one_driver = avail.sample
    return one_driver
  end


  def update_status
    return update(status: false)
  end


end
