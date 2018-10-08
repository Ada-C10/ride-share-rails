class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :index
      t.string :show

      t.timestamps
    end
  end
end
