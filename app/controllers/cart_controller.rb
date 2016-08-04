class CartController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    show = Show.find(params[:show_id])
    @cart.add_show(show.id)
    session[:cart] = @cart.contents
    redirect_to show_path(show)
  end

  def show
    @shows = @cart.shows
  end

  def destroy
    show = Show.find(params[:id])
    @cart.remove_show(show.id)
    link = %Q[<a href="/shows/#{show.id}"> #{show.title}</a>]
    flash[:success] = "Successfully removed #{link} from your cart."
    redirect_to "/cart"
  end

  def update
    show = Show.find(params[:format])
    @cart.update_quantity(show.id, params[:direction])
    redirect_to "/cart"
  end
end
