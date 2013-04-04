module LoginHelper
  def login_to_system(user)
    visit root_path
    fill_in('email', :with => user.email)
    fill_in('password', :with => user.password)
    click_button('Log in')
  end
end