class DriverPicture < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :driver_picture, :string 
  end
end
