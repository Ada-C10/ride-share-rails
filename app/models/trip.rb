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
    elsif self.status == :in_progress
      return nil
    end
  end

end
