class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  def self.nil_rating
    return Trip.where(rating: nil)
  end

end
