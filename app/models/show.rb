class Show < OpenStruct
  attr_reader :show
  def initialize(show)
    @show = show
  end

  def website
    if show.web_profiles.present?
      show.web_profiles.personal.url || show.web_profiles.other.url
  end

  def self.all_shows
    response = AudiosearchServices.new.all_shows
    response.map do |show|
      Show.new(show)
    end
  end
end
