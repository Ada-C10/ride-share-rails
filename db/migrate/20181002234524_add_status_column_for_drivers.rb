class AddStatusColumnForDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :active, :boolean, default: true
    add_column :passengers, :active, :boolean, default: true
  end
end
