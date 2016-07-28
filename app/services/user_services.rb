require 'audiosearch'
class UserServices

  attr_reader :client
  def initialize(client = nil)
    if client
      @client = client
    else
    @client ||= Audiosearch::Client.new(
        :id     => ENV['AS_API_KEY'].dup,
        :secret => ENV['AS_SECRET'].dup,
        :host   => ENV['AS_HOST'].dup,
        :debug  => false
      )
    end
  end

  def search(query, type = "shows")
    client.search({ q: "#{query}" }, "#{type}")
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
