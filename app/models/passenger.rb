class Passenger < ApplicationRecord
  has_many :trips, dependent: :destroy
  validates :name, :phone_num, presence: true, uniqueness: true 

  def total_charges
    trips = self.trips.where.not(cost: nil)

    return trips.map { |t| t.cost }.reduce(:+).to_f
  end

end
