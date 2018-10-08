class RemoveStatusColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :drivers, :status
    add_column :drivers, :status, :boolean, :default => true
  end
end
