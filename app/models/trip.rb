class Trip < ApplicationRecord
  validates :driver_id, :passenger_id, :date, :cost, presence: true

  belongs_to :driver
  belongs_to :passenger

  def cost_in_dollars
    return "$#{self.cost.to_f / 100}"
  end

end
