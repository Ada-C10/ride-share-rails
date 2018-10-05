class Passenger < ApplicationRecord
  has_many :trips, dependent: :nullify

  validates :name, presence: true
  validates :phone_num, presence:true

  def spent
    money = 0

    self.trips.each do |trip|
      if trip.cost != nil
        money += trip.cost
      end
    end

    money = money.to_f/100
    return money.round(2)
  end
end
