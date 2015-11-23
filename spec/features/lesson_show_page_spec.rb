require "rails_helper"

feature "lesson show page for a user", %{
  As an authorized user
  I want to see the lessons of a course
  So I can learn lesson by lesson
} do
  before(:each) do
    user = FactoryGirl.create(:user, role: "Admin")
    @course = FactoryGirl.create(:course)
    @lesson = FactoryGirl.create(:lesson, course_id: @course.id)
    login(user)
  end

  scenario "user visits lesson show page" do
    visit course_lesson_path(@course, @lesson)
    expect(page).to have_content(@lesson.title)
  end
end
