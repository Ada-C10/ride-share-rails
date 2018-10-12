class AddIsActiveToDriverAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :is_active, :bool
  end
end
