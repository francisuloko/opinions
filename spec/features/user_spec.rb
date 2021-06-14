require 'rails_helper'

describe 'Authentication', type: :feature do
  before :each do
    User.create(username: 'francis', fullname: 'Francis Uloko')
  end

  it 'signs in successfully' do
    visit login_path
    fill_in 'session_username', with: 'francis'
    click_button 'Login'
    expect(current_path).to eq(root_path)
  end

  it 'signs in fail' do
    visit login_path
    fill_in 'session_username', with: 'Francis'
    click_button 'Login'
    expect(current_path).to_not eq(root_path)
  end

end

describe 'Authenticated User Activities', type: :feature do
  before :each do
    @user1 = User.create(username: 'francis', fullname: 'Francis Uloko')
    @user2 = User.create(username: 'uloko', fullname: 'Uloko Francis')
    visit '/login'
    fill_in 'session_username', with: 'francis'
    click_button 'Login'
  end

  it 'visits user profile' do
    visit profile_path(@user1.username)
    expect(page).to have_current_path('/users/francis')
    expect(page).to have_text("What's happening?")
  end

  it 'accesses another user path' do
    visit '/users/uloko'
    expect(page).to have_http_status(:success)
    expect(page).to have_text('FOLLOWED BY')
  end

  it 'follows a user' do
    visit root_path
    expect(page).to have_text('WHO TO FOLLOW')
    find('a.follow').click
    expect(page).to find('a.unfollow')
  end

  it 'logs out a user' do
    click_link 'logout'
    expect(current_path).to eq(login_path)
  end
end
