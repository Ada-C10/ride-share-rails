class DateToInstanceOfDate < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :date, 'date USING date::date'
    remove_column(:trips, :Date)
  end
end
