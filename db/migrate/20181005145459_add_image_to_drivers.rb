class AddImageToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :image_url, :string
  end
end
