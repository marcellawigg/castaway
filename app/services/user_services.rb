class UserServices

  def initialize(user)
    @_user = user
    @_conn = Faraday.new("https://www.audiosear.ch/api")
  end

  def search(query)
    @_conn.headers["Authorization"] = "Token #{@_user.oauth_token}"
    response = @_conn.get("/search/shows/#{query.parameterize}")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

end
