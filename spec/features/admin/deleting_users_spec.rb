require 'spec_helper'

feature "Deleting users" do
  let(:admin) { FactoryGirl.create(:admin_user) }
  let(:user) { FactoryGirl.create(:user) }

  scenario "Deleting a user" do
    sign_in_as!(admin)
    visit admin_user_path(user)
    click_link "Delete User"

    expect(page).to have_content("User has been destroyed.")
    expect(page).to have_no_content(user.email)
  end

  scenario "Deleting self-user" do
    sign_in_as!(admin)
    visit admin_user_path(admin)
    click_link "Delete User"

    expect(page).to have_content("You can't delete yourself.")
    visit admin_user_path(admin)
  end
end
