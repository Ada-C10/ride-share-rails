class Driver < ApplicationRecord
  has_many :trips, dependent: :delete_all

  validates :name, presence: true
  validates :vin, presence: true

  def avg_rating
    sum = 0

    driver_trips = self.trips.where(driver_id: id)
    num_of_trips = driver_trips.count

    if num_of_trips == 0
      return 0
    end

    driver_trips.each do |trip|
      sum += trip.rating
    end

    average_rating = sum / num_of_trips

    return average_rating.round(2)

  end

  def total_trip_earnings
    driver_trips = self.trips.where(driver_id: id)
    num_of_trips = driver_trips.count
    standard_expense = num_of_trips * 1.65

    total_wo_deductions_before_formatting = 0
    driver_trips.each do |trip|
      total_wo_deductions_before_formatting += trip.cost.to_f
    end

    total_wo_deductions_after_format = total_wo_deductions_before_formatting / 100

    net_revenue = (total_wo_deductions_after_format - standard_expense) * 0.8

    return net_revenue.round(2)
  end

end
