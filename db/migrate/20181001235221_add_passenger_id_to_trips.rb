class AddPassengerIdToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :passenger_id
  end
end
