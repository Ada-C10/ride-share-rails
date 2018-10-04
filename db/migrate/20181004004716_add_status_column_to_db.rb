class AddStatusColumnToDb < ActiveRecord::Migration[5.2]
  def change
    add_column :drivers, :status, :integer, default: 1
    add_column :passengers, :status, :integer, default: 1
  end
end
