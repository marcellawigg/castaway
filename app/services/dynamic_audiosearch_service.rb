class DynamicAudiosearchService < BaseAudiosearchService


  def trending
    client.get_trending
  end

  def get_show(id) #won't need this
    client.get_show(id)
  end

  def get_website(id)
    if client.get_show(id)["web_profiles"].present?
      if client.get_show(id)["web_profiles"]["personal"].present?
        client.get_show(id)["web_profiles"]["personal"]["url"]
      elsif client.get_show(id)["web_profiles"]["other"].present?
        client.get_show(id)["web_profiles"]["other"]["url"]
      end
    end
  end

  def get_related(id)
    client.get_related(id, {type: 'shows', size: 5, from: 5})
  end

  def parse(response)
      JSON.parse(response.body)
  end
end
