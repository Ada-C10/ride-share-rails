class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :driver_id
      t.string :integer
      t.string :passenger_id
      t.string :integer
      t.string :date
      t.string :string
      t.string :rating
      t.string :integer
      t.string :cost
      t.string :integer

      t.timestamps
    end
  end
end
