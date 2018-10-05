class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :drivers, :is_available?, :is_available
  end
end
