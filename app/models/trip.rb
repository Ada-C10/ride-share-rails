class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def status
    if self.rating == nil
      return :in_progress
    else
      return :complete
    end
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
