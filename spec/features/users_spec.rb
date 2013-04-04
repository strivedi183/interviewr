require 'spec_helper'

describe 'Users' do
  describe 'GET /' do
    it 'shows a link for creating a new user' do
      visit root_path
      page.should have_link('Register')
    end
  end
  describe 'GET /users/new' do
    it 'shows the create form when the Register link is clicked' do
      visit root_path
      click_link('Register')
      page.should have_button('Register')
    end
    it 'clears the form when the cancel button is clicked' do
      visit root_path
      click_link('Register')
      page.should have_button('Register')
      click_link('Cancel')
      page.should_not have_button('Register')
    end
  end
  describe 'POST /users' do
    it 'creates a new user', :js => true do
      visit root_path
      click_link('Login')
      fill_in('Name', :with => 'bob')
      fill_in('reg_email', :with => 'bob@gmail.com')
      fill_in('user_password', :with => 'a')
      fill_in('user_password_confirmation', :with => 'a')
      click_button('Create User')
      page.should have_link('Login')
      page.should have_link('Hide')
      expect(User.first.name).to eq 'bob'
    end
  end
end