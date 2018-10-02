class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :date
      t.string :Date
      t.string :price
      t.string :integer
      t.string :rating
      t.string :integer

      t.timestamps
    end
  end
end
