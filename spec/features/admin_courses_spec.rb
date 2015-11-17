require "rails_helper"

feature "admin creates a course", %{
  As an admin
  I can create different courses
  So they can be available on the website
} do
  before(:each) do
    user = FactoryGirl.create(:user, role: "Admin")
    login(user)
  end

  scenario "admin click on 'new course' button in his dashboard" do
    visit admin_courses_path
    expect(page).to have_content("New course")
  end

  scenario "admin creates a new course" do
    visit new_admin_course_path
    fill_in "title", with: "Management"
    fill_in "description", with: "Best course ever"
    fill_in "duration", with: "2"
    fill_in "price", with: "4"
    click_on "Submit"
    expect(page).to have_content("Course created")
  end
end
