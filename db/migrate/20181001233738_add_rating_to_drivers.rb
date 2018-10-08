class AddRatingToDrivers < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :rating, :integer
  end
end
