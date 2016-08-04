class User < ActiveRecord::Base
  has_many :orders
  validates :name, presence: true
  validates :handle, presence: true, uniqueness: true

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.handle             = auth_info.extra.raw_info.screen_name
      new_user.avatar             = auth_info.extra.raw_info.profile_image_url
      new_user.bio                = auth_info.extra.raw_info.description
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_secret       = auth_info.credentials.secret
      new_user.location           = auth_info.extra.raw_info.location
    end
  end

  def has_payment_info?
    braintree_customer_id
  end
end
