class SearchesController < ApplicationController
  def index
    @results = results(params["query"])
  end

  private
  def results(query)
     SearchServices.new.search({q: query}).results
  end
end
