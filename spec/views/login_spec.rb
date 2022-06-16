require 'rails_helper'

RSpec.describe 'login', type: :feature do
  before(:each) do
    visit new_user_session_path
  end

  it 'I can see the username and password inputs and the "Submit" button.' do
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_button('Log in')
  end

  it 'When I click the submit button without filling in the username and the password, I get a detailed error.' do
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  it 'When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error.' do
    fill_in 'Email', with: 'notanemail'
    fill_in 'Password', with: '12345678'
    click_button 'Log in'
    expect(page).to have_content('Invalid Email or password')
  end

  it 'When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page.' do
    fill_in 'Email', with: 't@t.com'
    fill_in 'Password', with: '654321'
    click_button 'Log in'
    expect(page.current_path).to eql(root_path)
  end
end 