require 'rails_helper'

RSpec.describe Show, type: :model do
  it { should validate_uniqueness_of :id }
  it { should validate_uniqueness_of :title }
  it { should validate_presence_of :image_path }
end
