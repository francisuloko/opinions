require 'rails_helper'

describe 'Following', type: :feature do
  before :each do
    User.create(username: 'user1', fullname: 'John Doe')
    User.create(username: 'user2', fullname: 'Jane Doe')
    @user1 = User.find_by(username: 'user1')
    @user2 = User.find_by(username: 'user2')
    visit login_path
    fill_in 'session[username]', with: 'user1'
    click_button 'Login'
  end

  scenario 'who to follow' do
    expect(page).to have_content('Jane Doe')
  end

  scenario 'Follow user2' do
    first('a.follow').click
    expect(page).to have_text('1 Following')
  end

  scenario 'unfollow a user2' do
    visit root_path
    first('a.follow').click
    visit 'users/user1'
    first('a.unfollow').click
    expect(page).to have_text('0 Following')
  end
end
