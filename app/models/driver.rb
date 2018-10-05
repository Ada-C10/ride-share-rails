class Driver < ApplicationRecord
  # relation to trips
  has_many :trips

  # name must be unique and present
  validates :name, presence: true, uniqueness: true

  # vin must be unique and present
  validates :vin, presence: true, uniqueness: true

  def total_earnings
    if self.trips == []
      return 0
    else
      total = 0
      self.trips.each do |trip|
        cost = trip.cost / 100
        total += (cost - 1.65) * 0.80
      end
      return total
    end
  end

  def average_rating
    sum = 0
    count = 0
    completed_trips = self.trips.where(in_progress: false)

    completed_trips.each do |trip|
      if trip.rating != nil
        sum += trip.rating
        count += 1
      end
    end

    return (sum / count)
  end

  def self.new_trip_driver
    avail_drivers = self.where(active: true, status: true )
    driver = avail_drivers.first
    driver.status = false
    driver.save

    return driver.id
  end

  def self.search(term, page)
    if term
      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order(:name)
    else
<<<<<<< HEAD
      paginate(page: page, per_page: 10).order(:name)
=======
      paginate(page: page, per_page: 5).order(:name) 
>>>>>>> b130fb7e81d6334fc5a6aa293eda6ccc8d842c5f
    end
  end
end
