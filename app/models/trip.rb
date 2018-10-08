class Trip < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  # validates :driver_id, presence: true
  # validates :passenger_id, presence: true

  def rating_convert
    self.rating.each do |trip|
      trip.rating = * 0.01 * ('%.2f' % trip.rating)
      return trip.rating
    end
  end
end
#example driver show
# <td>$<%="#{'%.2f' % (trip.cost * 0.01)}"%></td>
