require 'spec_helper'

feature 'Profile page' do
  scenario 'Viewing' do
    user = FactoryGirl.create(:user, password: 'password')

    visit user_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end

  scenario "Editing" do
    user = FactoryGirl.create(:user, password: 'password')

    visit user_path(user)
    click_link 'Edit Profile'

    fill_in "Name", with: "Other name"
    click_button 'Update Profile'

    expect(page).to have_content("Profile has been updated.")
  end
end
