require 'spec_helper'

feature "Signing in" do
  scenario "Sign in" do
    user = FactoryGirl.create(:user, password: 'password')

    visit '/'

    click_link 'Sign in'

    fill_in "Name", with: user.name
    fill_in "Password", with: user.password

    click_button 'Sign in'

    expect(page).to have_content("Signed in succesfully")
  end
end
