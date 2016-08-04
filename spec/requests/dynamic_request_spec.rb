require "rails_helper"
  describe "DynamicAudiosearchService" do
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

    context "#trending" do
      it "returns ten trending subjects and podcasts about them" do
        VCR.use_cassette("trending") do
      end
    end
  end

  context "#image_paths(trend)" do
    it "returns image paths for a single trend" do
      VCR.use_cassette("image_paths(trend)") do
      end
    end
  end

  context "#get_website(id)" do
    it "returns website for a single website" do
      VCR.use_cassette("get_website(id)") do
        end
      end
    end

  context "#get_related(id)" do
    it "returns related items for a single show" do
      VCR.use_cassette("get_related(id)") do
      end
    end
  end
end
