class TrendingController < ApplicationController
  def index
    @results = results
    fresh_when @results
  end

  private
  def results
     DynamicAudiosearchService.new.trending
  end
end
