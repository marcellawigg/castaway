class AdsController < ApplicationController

  def new
    @show = Show.find(params[:show_id])
  end

  def create
    @show = Show.find(params[:show_id])
    if @show.domain == email_domain(params[:email])
      @show.update_attribute(:price, params[:podcast_ad_cost])
    else
      render :new
    end
  end

    def email_domain(email)
      email.split('@').last
  end
end
