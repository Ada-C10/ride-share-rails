class AddTripStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :status, :string, default: "Complete"
  end
end
