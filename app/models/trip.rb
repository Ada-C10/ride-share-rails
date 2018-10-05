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

  

end
