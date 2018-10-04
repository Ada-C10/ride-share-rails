class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :rating, presence: true, length: { in: 1..5 }


  def assign_rating
    if self.rating == 0
      return
    else
      return
    end
  end
end
