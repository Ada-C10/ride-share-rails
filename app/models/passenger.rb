class Passenger < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :phone_num, presence: true

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 20).order(:name)
    else
      paginate(page: page, per_page: 20).order(:name)
    end
  end

  def list_trips
    return self.trips.where(passenger_id: id)
  end

  def total_spent
    rides = list_trips
    spending = rides.map { |trip| (trip.cost * 0.01) }
    return "$#{spending.sum.round(2)}"
  end

  def start_ride
    if self.available || self.available.nil?
      self.available = false # set passenger unavailable
      self.save
      return true
    else
      return false
    end
  end

  def end_ride
    if self.available == false
      self.available = true # set chosen passegenger available
      self.save
    end
  end
end
