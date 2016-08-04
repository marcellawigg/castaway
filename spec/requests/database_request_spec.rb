require "rails_helper"
  describe "DatabaseAudiosearchService" do
    client = OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: "twitter",
      extra: {
        raw_info: {
          uid: "1234",
          name: "Marcella",
          handle: "WiggMarcella",
          avatar: "https://example.com.jpg",
          description: "desc",
          location: "Denver"
        }
      },
      credentials: {
        token: ENV["AS_API_KEY"],
        secret: ENV["TWITTER_SECRET"]
      }
    })

    context "#populate_database" do
      it "populates the database will all shows" do
        VCR.use_cassette("populate_database") do
          DatabaseAudiosearchService.new.populate_database
      end
    end
  end

  context "#image_paths(trend)" do
    it "returns image paths for a single trend" do
      VCR.use_cassette("image_paths(trend)") do
        DatabaseAudiosearchService.new.search(query: "this american life")
      end
    end
  end

  context "#get_website(id)" do
    xit "returns website for a single website" do
      VCR.use_cassette("get_website(id)") do
        end
      end
    end

  context "#get_related(id)" do
    xit "returns related items for a single show" do
      VCR.use_cassette("get_related(id)") do
      end
    end
  end
end
