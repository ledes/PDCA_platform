require "rails_helper"

feature "CRUD actions for lessons", %{
  As an admin
  I can create/edit/delete a lesson
  So I can be manage the content of a course
} do
  before(:each) do
    user = FactoryGirl.create(:user, role: "Admin")
    @course = FactoryGirl.create(:course)
    @lesson = FactoryGirl.create(:lesson, course_id: @course.id)

    login(user)
  end

  scenario "Admin visits new lesson page" do
    visit admin_course_path(@course)
    click_on "Add lesson"
    expect(page).to have_content("New Lesson")
  end

  scenario "Admin adds a new lesson to a course" do
    visit new_admin_course_lesson_path(@course)
    fill_in "lesson[title]", with: "Introduction"
    fill_in "lesson[priority]", with: 1
    click_on "Submit"
    expect(page).to have_content("Lesson added")
  end

  scenario "Admin tries to submit a lesson blank" do
    visit new_admin_course_lesson_path(@course)
    click_on "Submit"
    expect(page).to have_content("Title can't be blank and Priority can't be blank")
  end

  scenario "Admin sees all the lessons for a course" do
    visit admin_course_path(@course)
    expect(page).to have_content(@lesson.title)
  end

  scenario "Admin visit edit page of a lesson" do
    visit admin_course_path(@course)
    click_on "Edit lesson"
    expect(page).to have_content("Edit Lesson")
  end

  scenario "Admin edits a lesson" do
    visit edit_admin_course_lesson_path(@course, @lesson)
    fill_in "lesson[title]", with: "Introduction"
    fill_in "lesson[priority]", with: 1
    click_on "Submit"
  end

  scenario "Admin tries to edit a lesson with wrong data" do
    visit edit_admin_course_lesson_path(@course, @lesson)
    fill_in "lesson[title]", with: ""
    fill_in "lesson[priority]", with: 1
    click_on "Submit"
  end

  scenario "Admin deletes a lesson from course's show page" do
    visit admin_course_path(@course)
    click_on "Delete lesson"
    expect(page).to have_content("Lesson deleted")
    expect(page).to_not have_content(@lesson.title)
  end

  scenario "Admin deletes a lesson from lesson's edit page" do
    visit edit_admin_course_lesson_path(@course, @lesson)
    click_on "Delete lesson"
    expect(page).to_not have_content(@lesson.title)
  end
end
