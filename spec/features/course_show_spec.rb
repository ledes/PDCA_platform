require "rails_helper"

feature "user sees a courses", %{
  As a user
  I want to see the show page of a course
  So I can learn about it
} do
  scenario "user visits courses' index page" do
    user = FactoryGirl.create(:user)
    course = FactoryGirl.create(:course)
    login(user)
    visit course_path(course)
    expect(page).to have_content(course.title)
  end
end
