class AddActiveColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :status, :boolean, default: :true
    add_column :drivers, :status, :boolean, default: :true
  end
end
