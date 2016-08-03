class ShowsController < ApplicationController
  def show
    @show = Show.find(params["id"].to_i)
    fresh_when @show
  end
  def index
    @results = Show.search_for_shows(params[:query])
  end

  private
  def show_params
    params.require(:show).permit(:title, :description, :number_of_episodes, :image_path, :price)
  end
end
