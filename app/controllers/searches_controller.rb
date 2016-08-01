class SearchesController < ApplicationController
  def index
    @results = results(params["query"])
  end

  def show
    @result = result(params["id"])
    @related_shows = related(@result.id)
  end

  private
  def results(query)
     AudiosearchServices.new.search({q: query}).results
  end

  def result(id)
    AudiosearchServices.new.get_show(id)
  end

  def related(id)
    AudiosearchServices.new.get_related(id)
  end

  def host
    AudiosearchServices.new.get_show(id)["hosts"]["name"]
  end
end
