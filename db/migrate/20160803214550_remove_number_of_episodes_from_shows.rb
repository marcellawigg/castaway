class RemoveNumberOfEpisodesFromShows < ActiveRecord::Migration[5.0]
  def change
    remove_column :shows, :number_of_episodes
  end
end
