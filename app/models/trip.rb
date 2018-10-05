class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger
  #
  # Need to figure out how to only apply this if the currency doesn't
  # already have a decimal
  def convert_money(currency)
    return currency.to_f / 100
    # if currency.to_s.include?(".")
    #   return currency
    # else
    # return currency.to_f / 100
    # end
  end

end
