class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :drivers, :status, :is_available
    change_column :drivers, :is_available, :boolean, default: true
  end
end
