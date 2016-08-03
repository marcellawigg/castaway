class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_cart
  add_flash_types :success, :info, :warning, :danger
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def set_cart
    @cart = Cart.new(session[:cart])
  end
end
