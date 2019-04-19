class CreateColumnForInProgressTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :in_progress, :boolean, default: false
  end
end
