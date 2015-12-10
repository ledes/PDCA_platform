require "rails_helper"

feature "user sees user's show page", %{
  As a user
  I want to see the list of users
  so I can decide what profile I will visit
} do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login(@user)
  end

  scenario "User visits his profile" do
    visit user_path(@user)
    expect(page).to have_content(@user.first_name)
  end

  scenario "User sees links of his courses" do
    course = FactoryGirl.create(:course)
    CourseUser.create(course: course, user: @user)
    visit user_path(@user)
    expect(page).to have_content(course.title)
  end

  scenario "User visits other profile" do
    user2 = FactoryGirl.create(:user)
    visit user_path(user2)
    expect(page).to have_content(user2.first_name)
  end
end
