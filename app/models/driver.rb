class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true

  has_many :trips

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 20).order(:name)
    else
      paginate(page: page, per_page: 20).order(:name)
    end
  end

  def list_trips
    return self.trips.where(driver_id: id)
  end

  def total_earnings
    driven_trips = list_trips
    raw_earnings = driven_trips.map { |trip| (trip.cost * 0.01 - 1.65)}
    total_earnings = raw_earnings.sum * 0.8
    return "$#{total_earnings.round(2)}"
  end

  def average_rating
    driven_trips = list_trips.select { |trip| trip.driver_id == id && trip.rating != nil }
    ratings = driven_trips.map { |trip| trip.rating}
    average_rating = ratings.sum.to_f / ratings.length
    return average_rating.round(1)
  end

  def dispatch
    if self.available || self.available.nil?
      self.available = false # set chosen driver unavailable
      self.save
      return self.id
    else
      return nil
    end
  end

  def end_ride
    if self.available == false
      self.available = true # set chosen driver available
      self.save
    end
  end
end
