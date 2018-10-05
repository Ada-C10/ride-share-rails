class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

#validate here, or in controller, new and edit, or in schema.
  validates :rating, length: { in: 0..5 }, allow_nil: true

  def assign_rating
    if self.rating == 0
      return
    else
      return
    end
  end

  def assign_driver
    avail = Driver.where(status: true)
    #fix syntax 
    one_driver = avail.first
    one_driver.status = false
    return one_driver
  end

end
