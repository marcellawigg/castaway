class BaseAudiosearchService
  attr_reader :client
  def initialize
      @client ||= Audiosearch::Client.new(
        id: ENV['AS_API_KEY'].dup,
        secret: ENV['AS_SECRET'].dup,
        host: ENV['AS_HOST'].dup,
        debug: false
        )
  end

  def get_show(id) #won't need this
    client.get_show(id)
  end
end
