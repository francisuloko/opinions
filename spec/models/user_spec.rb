require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Association' do
    it { should have_many(:opinions) }
    it { should have_many(:likes) }
    it { should have_many(:request_connections).class_name('Following') }
    it { should have_many(:connection_requests).class_name('Following') }
    it { should have_many(:followers).through(:connection_requests) }
    it { should have_one_attached(:photo) }
    it { should have_one_attached(:cover_image) }
  end
end
