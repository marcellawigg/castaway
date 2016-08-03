class CreateAddTimestampsToShows < ActiveRecord::Migration[5.0]
  def change
    create_table :add_timestamps_to_shows do |t|
      t.timestamps
    end
  end
end
