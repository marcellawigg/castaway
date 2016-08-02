class Show < ApplicationRecord
  attr_reader :description,
  def initialize(show)
    @title = show["title"]
    @number_of_episodes = show["number_of_episodes"]
    @recent_episodes = show["episode_ids"].limit(5)
    @description = show["description"]
  end
end
