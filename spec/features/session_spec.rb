require 'spec_helper'
require 'features/shared/login_helper'
include LoginHelper

describe 'Session' do
  describe 'GET /' do
    it 'displays login link' do
      visit root_path
      page.should have_link('Login')
    end
  end

  describe 'GET /login' do
    it 'displays log in form' do
      visit root_path
      click_link('Login')
      page.should have_button('Log in')
    end
  end

  describe 'POST /login' do
    let(:user) {FactoryGirl.create(:user)}

    it 'logs the user into the system if credentials are correct', :js => true do
      visit root_path
      click_link('Login')
      fill_in('email', :with => 'bob@gmail.com')
      fill_in('password', :with => 'a')
      click_button('Log in')
      page.should have_link('Login')
    end

    it 'does not log the user into the system if credentials are incorrect', :js => true do
      visit root_path
      click_link('Login')
      fill_in('email', :with => user.email)
      fill_in('password', :with => 'b')
      click_button('Log in')
      page.should have_link('Login')
    end
  end
  describe 'DELETE /login' do
    it 'logs the user out of the system', :js => true do
      visit root_path
      click_link('Register')
      fill_in('user_name', :with => 'bob')
      fill_in('user_email', :with => 'bob@gmail.com')
      fill_in('user_phone', :with => '2123456789')
      fill_in('user_address', :with => 'New York')
      fill_in('user_password', :with => 'a')
      fill_in('user_password_confirmation', :with => 'a')
      click_button('Register')
      page.should have_link('Login')
      page.should have_link('Register')
      page.should have_text('Erotiquiz')
      visit root_path
      click_link('Login')
      fill_in('email', :with => 'bob@gamil.com')
      fill_in('password', :with => 'a')
      click_button('Log in')
      page.should have_text('Erotiquiz')
    end
  end
end