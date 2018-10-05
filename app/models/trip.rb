class Trip < ApplicationRecord

   validates :rating, numericality: { only_integer: true, less_than: 6, allow_nil: true}


  belongs_to :driver
  belongs_to :passenger

end
