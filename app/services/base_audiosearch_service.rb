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
end
