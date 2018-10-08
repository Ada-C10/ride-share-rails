class AddStatusToPassengers < ActiveRecord::Migration[5.2]
  def change
        add_column :passengers, :status, :string, :default => :active
  end
end
