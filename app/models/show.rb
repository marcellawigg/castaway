class Show < OpenStruct
  attr_reader :show
  def initialize(show)
    @show = show
  end

  def website
    if show.web_profiles.present?
      show.web_profiles.personal.url || show.web_profiles.other.url
  end

  def self.all_shows
    response = AudiosearchServices.new.all_shows
    response.map do |show|
      Show.new(show)
    end
  end

  #Try to pull in all the information
  #don't know how to pull in all information
  #task query - only save if not an error
  # rake run background task (seed_database) - rake task: heroku scheduler. Won't even have to create a service. Let a cron scheduler. https://github.com/popuparchive/audiosearch-cookbook/wiki/Searching-Shows
  #database_audiosearch_service, dynamic_audiosearch_service, both inheriting from base_audiosearch_service
  #Show.new(show) in the rake task
end
