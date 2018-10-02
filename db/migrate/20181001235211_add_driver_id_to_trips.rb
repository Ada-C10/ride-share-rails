class AddDriverIdToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :driver_id
  end
end
