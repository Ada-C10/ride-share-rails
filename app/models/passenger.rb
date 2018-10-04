class Passenger < ApplicationRecord
  has_many :trips, :dependent => :nullify

  def total_spending

    (self.trips.sum(:cost))/100.to_f

    #TODO take the visual part in the view for cent to $

  end
end
