class AddDefaultDriverAvailability < ActiveRecord::Migration[5.2]
  def change
    change_column :drivers, :status, :string, :default => "available"
  end
end
