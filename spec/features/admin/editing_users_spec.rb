require 'spec_helper'

feature "Editing users" do
  let(:admin) { FactoryGirl.create(:admin_user) }
  let(:user) { FactoryGirl.create(:user) }

  before do

    sign_in_as!(admin)
    visit admin_user_path(user)
    click_link "Edit User"
  end

  scenario "Editing a user" do
    fill_in "Email", with: "newguy@example.com"
    click_button "Update User"

    expect(page).to have_content("User has been updated.")

    within("#users") do
      expect(page).to have_content("newguy@example.com")
      expect(page).to_not have_content(user.email)
    end
  end

  scenario "Toggling user's admin ability" do
    check "Is an admin user?"
    click_button "Update User"
    expect(page).to have_content("User has been updated.")
    within("#users") do
      expect(page).to have_content("#{user.email} (Admin)")
    end
  end
end
