namespace :import do
  desc "Import shows"
  task create_shows: :environment do
    service = DatabaseAudiosearchService.new
    service.populate_database
  end
end
