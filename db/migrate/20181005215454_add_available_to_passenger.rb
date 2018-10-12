class AddAvailableToPassenger < ActiveRecord::Migration[5.2]
  def change
      add_column :passengers, :available, :boolean
  end
end
