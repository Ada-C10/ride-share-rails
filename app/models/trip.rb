class Trip < ApplicationRecord
  validates :driver_id, :passenger_id, :date, :cost, presence: true
  validates :rating, :inclusion => {:in => [nil, 1, 2, 3, 4, 5]}
  validates :cost, numericality: { only_integer: true }

  belongs_to :driver
  belongs_to :passenger

  def cost_in_dollars
    return "$#{self.cost.to_f / 100}"
  end

  def editable_cost_in_dollars
    return "%.2f" % "#{(self.cost.to_f / 100)}"
  end

  def fill_trip_hash
    available_drivers = Driver.select { |driver| driver.is_available? }
    driver = available_drivers.sample
    trip_hash = {driver_id: driver.id, date: DateTime.now, cost: rand(200..5000)}
    trip_hash
  end


end
