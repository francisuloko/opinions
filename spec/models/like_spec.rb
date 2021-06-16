require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like Associations' do
    it { should belong_to(:user).class_name('User') }
    it { should belong_to(:opinion).class_name('Opinion') }
  end
end
