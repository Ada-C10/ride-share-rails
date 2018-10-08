class DeleteColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :passengers, :index
    remove_column :passengers, :show
  end
end
