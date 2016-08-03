class ShowsController < ApplicationController
  def show
    @show = Show.find(params["id"].to_i)
    @primary_email = primary_email(@show.domain)
  end

  def create
  @show = Show.new(show_params)
  @show.save
end

  private
  def show_params
    params.require(:show).permit(:title, :description, :number_of_episodes)
  end

  def primary_email(domain)
    EmailHunterServices.new.find_primary_email(domain)
  end
end
