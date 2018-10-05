class Trip < ApplicationRecord
   belongs_to :driver
   belongs_to :passenger

   validates :date, presence: true
   validates :rating, presence: true
   validates :cost, presence: true
   validates :driver_id, presence: true
   validates :passenger_id, presence: true


   def passenger_name
     passenger = self.passenger
     return passenger.name
   end

   def driver_name
     driver = self.driver
     return driver.name
   end

end
