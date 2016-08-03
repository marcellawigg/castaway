class AddPriceToShows < ActiveRecord::Migration[5.0]
  def change
    add_column :shows, :price, :decimal
  end
end
