require 'rails_helper'

describe 'Registration', type: :feature do

  it 'registers user in succesfully' do
    visit 'users/new'
    fill_in 'user[fullname]', with: 'francis'
    fill_in 'user[username]', with: 'francis'
    click_button 'Update'
    expect(current_path).to eq(root_path)
  end

  it 'registers user in succesfully' do
    visit 'users/new'
    fill_in 'user[fullname]', with: ''
    fill_in 'user[username]', with: ''
    click_button 'Update'
    expect(page).to have_text('minimum is 2 characters')
  end
end
