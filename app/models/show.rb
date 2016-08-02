class Show < OpenStruct
  attr_reader :id, :title, :description, :number_of_episodes, :website
  def initialize(show)
    @id = show["id"]
    @title = show["title"]
    @description = show["description"]
    @number_of_episodes = show["number_of_episodes"]
  end

  def website
    if show["web_profiles"]["personal"].present?
      show["web_profiles"]["personal"]["url"]
    elsif show["web_profiles"]["other"].present?
      show["web_profiles"]["other"]["url"]
    end
  end

  def domain
    website.gsub("http://www.","")
  end
  # rake run background task (seed_database) - rake task: heroku scheduler. Won't even have to create a service. Let a cron scheduler. https://github.com/popuparchive/audiosearch-cookbook/wiki/Searching-Shows
  #database_audiosearch_service, dynamic_audiosearch_service, both inheriting from base_audiosearch_service
  #Show.new(show) in the rake task
  #squash assets to get it up to heroku
  #
end
