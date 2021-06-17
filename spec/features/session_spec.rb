require 'rails_helper'

describe 'Session', type: :feature do
  before :each do
    User.create(username: 'francis', fullname: 'Francis Uloko')
  end

  it 'signs/signout user in succesfully' do
    visit login_path
    fill_in 'session[username]', with: 'francis'
    click_button 'Login'
    expect(current_path).to eq(root_path)
    first('a.logout').click
    expect(page).to_not have_text('Home')
  end

  it 'does not sign in user successfully' do
    visit login_path
    fill_in 'session[username]', with: 'Francis'
    click_button 'Login'
    expect(page).to have_text('Something went wrong')
  end
end
