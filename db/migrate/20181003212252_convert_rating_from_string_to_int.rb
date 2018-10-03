class ConvertRatingFromStringToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :rating, 'integer USING rating::integer'
  end
end
