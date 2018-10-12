class AddIsActiveToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :deactivated, :bool
  end
end
