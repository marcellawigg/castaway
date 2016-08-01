require 'uri'

class EmailHunterServices

  def initialize
    @_connection = Faraday.new("https://api.emailhunter.co/v1/")
    @_api_key = ENV['EMAILHUNTER_API_KEY']
  end

  def find_primary_email(domain)
    if domain.nil?
      "No website domain found."
    else
      domain = URI.parse(domain).host
      response = @_connection.get "search?domain=#{domain}&api_key=#{@_api_key}"
      email_hash = parse(response)["emails"]
      if email_hash.empty?
        "No email available."
      else
        email_hash.first["value"]
      end
    end
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
