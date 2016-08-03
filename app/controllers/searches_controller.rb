class SearchesController < ApplicationController
  def index
    @pg_search_documents = PgSearch.multisearch(params["query"])
  end

  private
  def results(query)
     DatabaseAudiosearchService.new.search({q: query, page: 1}).results
  end

  def result(id)
    DynamicAudiosearchService.new.get_show(id)
  end

  def related(id)
    DynamicAudiosearchService.new.get_related(id)
  end

  def website(id)
    DynamicAudiosearchService.new.get_website(id)
  end
end
