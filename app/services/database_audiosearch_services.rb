require "activerecord-import/base"

class DatabaseAudiosearchServices < BaseAudiosearchService
  ActiveRecord::Import.require_adapter('pg')

  def populate_database
    res = search({ q: '*'}, 'shows')
    total_pages = res.total_results.fdiv( res.results_per_page ).ceil
    pages = (0..total_pages).to_a
    pages.each do |page|
      search({ q: '*', page: page}, 'shows').results.each do |show|
        Show.create(id: show["id"], title: show["title"], description: show["description"], number_of_episodes: show["number_of_episodes"])
        puts "#{show.title} created"
      end
    end
  end

  def search(query, type = "shows")
    client.search(query, type)
  end

  def trending
    client.get_trending
  end

  def get_show(id) #won't need this
    client.get_show(id)
  end


  def get_related(id)
    client.get_related(id, {type: 'shows', size: 5, from: 5})
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
