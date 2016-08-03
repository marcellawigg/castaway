class CloudinaryService
  def initialize
    @cloud_name = ENV['cloudinary_cloud_name']
    @api_key = ENV['cloudinary_api_key']
    @secret = ENV['cloudinary_api_secret']
  end

end
