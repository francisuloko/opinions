require 'rails_helper'

RSpec.describe Following, type: :model do
  describe 'Following Association' do
    it { should belong_to(:follower).class_name('User') }
    it { should belong_to(:followed).class_name('User') }
  end
end
