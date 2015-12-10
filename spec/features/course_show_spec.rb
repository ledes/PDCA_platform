require "rails_helper"

feature "user sees a courses", %{
  As a user
  I want to see the show page of a course
  So I can learn about it
} do
  before(:each) do
    user = FactoryGirl.create(:user)
    @course = FactoryGirl.create(:course)
    @lesson = FactoryGirl.create(:lesson, course_id: @course.id)
    login(user)
  end
  scenario "user visits courses' index page" do
    visit course_path(@course)
    expect(page).to have_content(@course.title)
    expect(page).to have_content(@lesson.title)
  end

  scenario "user can join a course" do
    visit course_path(@course)
    click_on "Join course"
    expect(page).to have_content("You can start the course now")
    expect(page).to_not have_content("Join course")
  end

  scenario "user sees list of lessons as links after joining a course" do
    lesson = FactoryGirl.create(:lesson, course: @course)
    visit course_path(@course)
    expect(page).to_not have_selector(".links")
    click_on "Join course"
    expect(page).to have_selector(".links")
  end

  scenario "user sees link to take the quizz" do

  end

  scenario "user clicks on quiz link" do

  end

end
