require "rails_helper"

feature "CRUD actions for lessons", %{
  As an admin
  I can create/edit/delete a lesson
  So they can be manage the content of a course
} do
  before(:each) do
    user = FactoryGirl.create(:user, role: "Admin")
    @course1 = FactoryGirl.create(:course)
    login(user)
  end

  scenario "admin visits new lesson page" do
    visit admin_course_path(@course1)
    click_on "Add lesson"
    expect(page).to have_content('New Lesson')

  end

  scenario "admin adds a new lesson to a course" do
    visit new_admin_course_lesson_path(@course1)
    fill_in "lesson[title]", with: "Introduction"
    fill_in "lesson[priority]", with: 1
    click_on "Submit"
    expect(page).to have_content("Lesson added")
  end

  scenario "admin tries to submit a lesson blanck" do
    visit new_admin_course_lesson_path(@course1)
    click_on "Submit"
    expect(page).to have_content("Title can't be blank and Priority can't be blank")
  end

end
