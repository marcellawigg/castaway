class SearchesController < ApplicationController
  def index
    @results = results(params["query"])
  end

  def show
    @result = result(params["id"])
    @related_shows = related(@result.id)
    @website = website(@result.id)
    @email = primary_email(@website)
  end

  private
  def results(query)
     AudiosearchServices.new.search({q: query, page: 1}).results
  end

  def result(id)
    AudiosearchServices.new.get_show(id)
  end

  def related(id)
    AudiosearchServices.new.get_related(id)
  end

  def website(id)
    AudiosearchServices.new.get_website(id)
  end

  def primary_email(domain)
    EmailHunterServices.new.find_primary_email(domain)
  end
end
