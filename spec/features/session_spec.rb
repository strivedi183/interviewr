require 'spec_helper'

describe 'Session' do
  let(:user) {FactoryGirl.create(:user)}
  describe 'GET /' do
    it 'displays log in button' do
      visit root_path
      page.should have_button('Log in')
    end
  end

  describe 'POST /login' do
    it 'logs the user into the system if credentials are correct', :js => true do
      visit root_path
      fill_in('email', :with => user.email)
      fill_in('password', :with => 'a')
      click_button('Log in')
      page.should have_link('Logout')

    end
    it 'does not log the user into the system if credentials are incorrect' do
      visit root_path
      fill_in('email', :with => user.email)
      fill_in('password', :with => 'b')
      click_button('Log in')
      page.should have_button('Log in')
    end
  end
  describe 'DELETE /login' do
    it 'logs the user out of the system', :js => true do
      visit root_path
      fill_in('email', :with => user.email)
      fill_in('password', :with => 'a')
      click_button('Log in')
      page.should have_link('Logout')
      click_link('Logout')
      page.should have_button('Log in')
    end
  end
end