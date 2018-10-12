class AddRatingAndCostToTrip < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :rating, :integer
    add_column :trips, :cost, :integer
  end
end
