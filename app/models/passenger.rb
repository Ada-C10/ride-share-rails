class Passenger < ApplicationRecord
  has_many :trips, :dependent => :nullify

  validates :name, :phone_num, presence: true


  def total_spending

    self.trips.sum(:cost)

    #TODO take the visual part in the view for cent to $

  end
end
