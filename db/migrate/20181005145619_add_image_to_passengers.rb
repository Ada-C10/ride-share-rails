class AddImageToPassengers < ActiveRecord::Migration[5.2]
  def change
    add_column :passengers, :image_url, :string
  end
end
