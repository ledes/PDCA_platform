require "rails_helper"

feature "user sees list of courses", %{
  As a user
  I want to see all the courses
  So I can decide which one I can take
} do
  scenario "user visits courses' index page" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    login(user)
    visit courses_path
    expect(page).to have_content(course.title)
  end
end
