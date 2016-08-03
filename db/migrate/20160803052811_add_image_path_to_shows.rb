class AddImagePathToShows < ActiveRecord::Migration[5.0]
  def change
    add_column :shows, :image_path, :string
  end
end
