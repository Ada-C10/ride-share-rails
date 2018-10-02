class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :string,
      t.string :phone_num
      t.string :string

      t.timestamps
    end
  end
end
