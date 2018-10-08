class ChangeStatusToBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :drivers, :status, 'boolean USING status::boolean', :default => true
  end
end
