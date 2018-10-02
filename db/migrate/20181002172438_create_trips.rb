class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.integer :rating
      t.datetime :date
      t.integer :cost

      t.timestamps
    end
  end
end
