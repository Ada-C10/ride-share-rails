class Passenger < ApplicationRecord
  validates :name, :phone_num, presence: true

  has_many :trips, dependent: :nullify

  def total_charges
    sum = 0
    self.trips.each do |trip|
        sum += trip.cost
    end
    sum
  end

  def total_charges_in_dollars
    return "$#{total_charges.to_f / 100}"
  end

end
