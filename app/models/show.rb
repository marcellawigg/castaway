class Show < ApplicationRecord

  def self.search(query)
    response = UserServices.new(current_user).search(query)
    response.map do |show|
      Show.new(show)
    end
  end
end
