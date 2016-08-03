class SearchesController < ApplicationController
  def index
    @results = Show.search_for_shows(params[:query])
  end
end
