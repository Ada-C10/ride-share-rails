class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  validates :date, presence: true


  # format: {with: /\A\d{1,3}\.\d{2}\z/, message: 'Must have two decimal places, up to 999.99'}, allow_nil: true

  def status
    # safer to base status on cost than rating, because cost is back-end and rating is user-enterd
    if self.cost == nil
      return :in_progress
    else
      return :complete
    end
  end

  def assign_random_cost
    return rand(500..10000)
  end

  def formatted_cost
    if self.status == :complete
      return "%.2f" % "#{self.cost/100.0}"
    else
      return self.status
    end
  end

  def formatted_rating
    if self.status == :complete
      return self.rating
    else
      return self.status
    end
  end

end
