require "activerecord-import/base"

class DatabaseAudiosearchService < BaseAudiosearchService
  ActiveRecord::Import.require_adapter('pg')
  attr_reader :client

  def populate_database
    res = search({ q: '*'}, 'shows')
    total_pages = res.total_results.fdiv( res.results_per_page ).ceil
    pages = (0..total_pages).to_a
    pages.each do |page|
      search({ q: '*', page: page}, 'shows').results.each do |show|
        Show.create(id: show["id"], title: show["title"], description: show["description"], image_path:  show["image_files"] ? show["image_files"].first["file"]["url"] : nil, price: nil)
        puts "#{show.title} created"
      end
    end
  end

  def search(query, type = "shows")
    client.search(query, type)
  end
end
