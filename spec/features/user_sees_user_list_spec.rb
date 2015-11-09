require "rails_helper"

feature "user sees users list", %{
  As a user
  I want to see other users' profile
  So I can see what they are interested about
} do

  scenario "User visits users' index page" do
    user = FactoryGirl.create(:user)
    login(user)
    visit users_path
    expect(page).to have_content("List of users")
  end
end
