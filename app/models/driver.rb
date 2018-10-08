class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true

  def amount_earned
    sum = 0
    self.trips.each do |trip|
      # converting cents to dollars
      cost = trip.cost
      cost = trip.convert_money(trip.cost)
      sum += cost
    end
    return ( (sum - 1.65) * 0.80 ).round(2)
  end

  def average_rating
    sum_averages = 0
    trips.each do |trip|
      sum_averages += trip.rating
    end
    return sum_averages / trips.length
  end

  # TODO Method to select first active driver
  # Driver.all.select { |drv| drv.status == "active" }.fist
  # Unsure how to do this with current setup as _form is being used for new and edit.
  # Would probably need to be applied based on whether it's a create vs update .

end
