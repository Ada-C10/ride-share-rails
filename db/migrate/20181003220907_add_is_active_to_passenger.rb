class AddIsActiveToPassenger < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :is_active, :boolean
  end
end
