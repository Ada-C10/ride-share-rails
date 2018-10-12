class RemoveIsActiveFromDrivers < ActiveRecord::Migration[5.2]
  def change
    remove_column :drivers, :deactivated
  end
end
