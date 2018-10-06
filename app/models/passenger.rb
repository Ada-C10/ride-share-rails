class Passenger < ApplicationRecord
  has_many :trips, :dependent => :nullify

  validates :name, :phone_num, presence: true


  def total_spending
    self.trips.sum(:cost)
  end
end
