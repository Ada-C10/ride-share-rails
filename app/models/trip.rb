class Trip < ApplicationRecord
  validates :driver_id, :passenger_id, :date, :cost, presence: true
  validates :rating, :inclusion => {:in => 1..5}

  belongs_to :driver
  belongs_to :passenger

  def cost_in_dollars
    return "$#{self.cost.to_f / 100}"
  end

end
