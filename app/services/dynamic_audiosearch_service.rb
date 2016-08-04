class DynamicAudiosearchService < BaseAudiosearchService

  def trending
    client.get_trending
  end

  def image_paths(trend)
      trend.related_episodes.map do |episode|
        Show.where(title: episode.show_title).pluck(:image_path)
      end.flatten
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
