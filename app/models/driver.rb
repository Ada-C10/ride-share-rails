class Driver < ApplicationRecord
  has_many :trips

  validates :name, presence: true
  validates :vin, presence: true, length: { in: 17..17} 
  def self.active_drivers
    return Driver.all.select {|driver| driver.status == true}
  end
end
