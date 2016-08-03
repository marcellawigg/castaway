class ShowsController < ApplicationController
  def show
    @show = Show.find(params["id"].to_i)
    fresh_when @show
  end

  private
  def show_params
    params.require(:show).permit(:title, :description, :number_of_episodes)
  end
end
