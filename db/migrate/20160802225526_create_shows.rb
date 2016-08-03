class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :description
      t.integer :number_of_episodes
    end
  end
end
