class Show < ActiveRecord::Base
  validates_uniqueness_of :id
  include PgSearch
  pg_search_scope :search_for_shows, :against => [:title, :description, :id]

  def website
    DynamicAudiosearchService.new.get_website(self.id)
  end

  def domain
    if website
      website.gsub("http://www.","")
    end
  end

  def email
    EmailHunterService.new.find_primary_email(domain)
  end
end
  # rake run background task (seed_database) - rake task: heroku scheduler. Won't even have to create a service. Let a cron scheduler. https://github.com/popuparchive/audiosearch-cookbook/wiki/Searching-Shows
  #database_audiosearch_service, dynamic_audiosearch_service, both inheriting from base_audiosearch_service
  #Show.new(show) in the rake task
  #squash assets to get it up to heroku
  #
