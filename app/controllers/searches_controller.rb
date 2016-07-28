class SearchesController < ApplicationController
  def index
    @results = results(params["query"])
  end

  private
  def results(query)
     AudiosearchServices.new.search({q: query}).results
  end
end
