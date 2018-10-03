class Driver < ApplicationRecord
 has_many :trips
 has_many :passengers, through: :trips

 validates :name, presence: true
 validates :vin, presence: true

 def total_revenue
   total = 0
   trips.each do |trip|

   total += (trip.cost - 1.65)
   end
   return total_revenue = (total * 0.80)
 end


end
