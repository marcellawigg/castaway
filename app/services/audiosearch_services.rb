class AudiosearchServices
  attr_reader :client

 def initialize
     @client ||= Audiosearch::Client.new(
       id: ENV['AS_API_KEY'].dup,
       secret: ENV['AS_SECRET'].dup,
       host: ENV['AS_HOST'].dup,
       debug: false
       )
 end

  def search(query, type = "shows")
    client.search(query, type)
  end

  def trending
    client.get_trending
  end

  def get_show(id)
    client.get_show(id)
  end

  def get_website(id) #make model so that hits API less and more efficient
    if get_show(id).web_profiles.present?
      if client.get_show(id).web_profiles.personal
        client.get_show(id).web_profiles.personal.url
      else
        client.get_show(id).web_profiles.other.url
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
