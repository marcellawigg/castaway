class TrendingController < ApplicationController
  def index
    @results = results
    fresh_when @results
    @service = DynamicAudiosearchService.new
  end

  private
  def results
     DynamicAudiosearchService.new.trending
  end
end
