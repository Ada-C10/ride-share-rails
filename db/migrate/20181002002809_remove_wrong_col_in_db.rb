class RemoveWrongColInDb < ActiveRecord::Migration[5.2]
  def change
    remove_column(:trips, :integer)
    remove_column(:drivers, :string)
    remove_column(:passengers, :string)
  end
end
