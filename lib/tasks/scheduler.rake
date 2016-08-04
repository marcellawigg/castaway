desc "This task is called by the Heroku scheduler add-on"
task create_shows: :environment do
  service = DatabaseAudiosearchService.new
  service.populate_database
end
