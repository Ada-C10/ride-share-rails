class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

<<<<<<< HEAD
 

=======
  validates :date, presence: true
  validates :passenger_id, presence: true
  validates :driver_id, presence: true

  def format_cost
    return (cost / 100).round(2)
  end
>>>>>>> 7f55b539064611065a73f87105d0b8ca4458aba1
end
