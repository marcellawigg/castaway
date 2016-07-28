class TrendingController < ApplicationController
  def index
    @results = results
  end

  private
  def results
     AudiosearchServices.new.trending
  end
end
