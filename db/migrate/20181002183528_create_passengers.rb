class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :phone_num
      t.string :name

      t.timestamps
    end
  end
end
