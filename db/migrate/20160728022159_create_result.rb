class CreateResult < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.string :title
      t.string :network
      t.string :categories
      t.string :description
      t.string :hosts
      t.string :ui_url
      t.string :image_files
    end
  end
end
