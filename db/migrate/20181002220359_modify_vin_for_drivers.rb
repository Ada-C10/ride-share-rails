class ModifyVinForDrivers < ActiveRecord::Migration[5.2]
  def change
    rename_column :drivers, :VIN, :vin
  end
end
