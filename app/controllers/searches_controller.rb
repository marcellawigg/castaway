class SearchesController < ApplicationController

  def index
    @results = UserServices.new(current_user).search("this")
  end
end
