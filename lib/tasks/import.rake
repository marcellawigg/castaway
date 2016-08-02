namespace :import do
  desc "Import shows"
  task create_shows: :environment do
# get all pages
    service = AudiosearchServices.new
    res = service.search({ q: '*'}, 'shows')

    total_pages = res.total_results.fdiv( res.results_per_page ).ceil
    pages = (0..total_pages).to_a
    pages.each do |page|
      res = service.search({ q: '*', page: page}, 'shows')
      res.results.each do |show|
        Show.new(show)
        puts "#{show.title} created"
      end
    end
  end
end
