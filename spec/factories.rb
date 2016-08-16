FactoryGirl.define do
  factory :user do
    uid "1"
    name "test"
    handle "handletest"
    avatar "google.com"
    bio "test bio"
    oauth_token "111"
    oauth_secret "notsosecret"
    auth_info "location"
  end

  factory :show do
     sequence :title do |n|
       "Title-#{n}"
     end
     sequence :description do |n|
       "Desc#{n}"
     end
     sequence :image_path do |n|
       "imgur.com/#{n}"
     end
     price nil
   end
end
