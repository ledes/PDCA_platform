require "rails_helper"

feature "admin CRUD actions for a course", %{
  As an admin
  I can create different courses
  So they can be available on the website
} do
  before(:each) do
    user = FactoryGirl.create(:user, role: "Admin")
    @course1 = FactoryGirl.create(:course)
    login(user)
  end

  scenario "admin click on 'new course' button in his dashboard" do
    visit admin_courses_path
    expect(page).to have_content("New course")
  end

  scenario "admin creates a new course" do
    visit new_admin_course_path
    fill_in "course[title]", with: "Management"
    fill_in "course[description]", with: "Best course ever"
    fill_in "course[duration]", with: "2"
    fill_in "course[price]", with: "4"
    click_on "Submit"
    expect(page).to have_content("Course created")
  end

  scenario "admin tries to create a new course without title or description" do
    visit new_admin_course_path
    fill_in "course[description]", with: "Best course ever"
    fill_in "course[duration]", with: "2"
    fill_in "course[price]", with: "4"
    click_on "Submit"
    expect(page).to_not have_content("Course created")
    expect(page).to have_content("Something went wrong")

    visit new_admin_course_path
    fill_in "course[title]", with: "Management"
    fill_in "course[duration]", with: "2"
    fill_in "course[price]", with: "4"
    click_on "Submit"
    expect(page).to_not have_content("Course created")
    expect(page).to have_content("Something went wrong")

    visit new_admin_course_path
    fill_in "course[duration]", with: "2"
    fill_in "course[price]", with: "4"
    click_on "Submit"
    expect(page).to_not have_content("Course created")
    expect(page).to have_content("Something went wrong")
  end

  scenario "admin edits a course" do
    visit edit_admin_course_path(@course1)
    fill_in "course[duration]", with: "4"
    click_on "Submit"
    expect(page).to have_content("Course edited successfully")
  end

  scenario "admin deletes a course from index page" do
    visit admin_courses_path
    click_on "Delete"
    expect(page).to_not have_content(@course1.title)
    expect(page).to have_content("Course deleted")
  end

  scenario "admin deletes a course from show page" do
    visit admin_course_path(@course1)
    click_on "Delete"
    expect(page).to_not have_content(@course1.title)
    expect(page).to have_content("Course deleted")
  end

  scenario "admin adds a lesson to a course" do
  end

  scenario "admin adds a quizz to a course" do
  end
end
