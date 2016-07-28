class SearchServices
  attr_reader :client

 def initialize
  #  (clien = nil)
  #  if clien
  #    @client = clien
  #  else
     @client ||= Audiosearch::Client.new(
       id: ENV['AS_API_KEY'].dup,
       secret: ENV['AS_SECRET'].dup,
       host: ENV['AS_HOST'].dup,
       debug: false
       )
  #  end
 end

  def search(query, type = "shows")
    client.search(query, type)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
