class ChangeCostToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :cost, 'integer USING cost::integer'
  end
end
