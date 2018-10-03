class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  #
  # Need to convert trip cost to cents 
  def convert_money(cents)
    return cents.to_f / 100
  end
end
