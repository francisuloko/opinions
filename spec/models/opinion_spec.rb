require 'rails_helper'

RSpec.describe Opinion, type: :model do
  describe 'Following Association' do
    it { should belong_to(:author).class_name('User') }
    it { should have_many(:likes) }
  end
end
