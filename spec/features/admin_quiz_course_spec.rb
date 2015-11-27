require "rails_helper"

feature "CRUD actions for quizzes", %{
  As an admin
  I can create/edit/delete a quiz
  So I can be test the students
} do
  before(:each) do
    user = FactoryGirl.create(:user, role: "Admin")
    @course = FactoryGirl.create(:course)
    @quiz = FactoryGirl.create(:quiz, course_id: @course.id)
    login(user)
  end

  scenario "Admin visits new quiz page" do
    visit admin_course_path(@course)
    click_on "Add quiz"
    expect(page).to have_content("New Quiz")
  end

  scenario "Admin adds a new quiz to a course" do
    visit new_admin_course_quiz_path(@course)
    fill_in "Question", with: "What is the best tool for management?"
    fill_in "Response a", with: "5s"
    fill_in "Response b", with: "5why's"
    fill_in "Response c", with: "Lean"
    fill_in "Response d", with: "Six sigma"
    select("response_B", :from => "quiz[right_answer]")
    click_on "Submit"
    expect(page).to have_content("Quiz added")
  end

  scenario "Admin tries to submit a lesson blank" do
    visit new_admin_course_quiz_path(@course)
    click_on "Submit"
    expect(page).to have_content(
      "Question can't be blank, Response a can't be blank, and Response b can't be blank"
    )
  end

  scenario "Admin sees all the quizzes for a course" do
    visit admin_course_path(@course)
    expect(page).to have_content(@quiz.question)
  end

  scenario "Admin visit edit page of a quiz" do
    visit admin_course_path(@course)
    click_on "Edit quiz"
    expect(page).to have_content("Edit Quiz")
  end

  scenario "Admin edits a quiz" do
    visit edit_admin_course_quiz_path(@course, @quiz)
    fill_in "Question", with: "What is the best tool for management?"
    fill_in "Response a", with: "5s"
    fill_in "Response b", with: "5why's"
    fill_in "Response c", with: "Lean"
    fill_in "Response d", with: "Six sigma"
    select("response_B", :from => "quiz[right_answer]")
    click_on "Submit"
  end

  scenario "Admin deletes a quiz from course's show page" do
    visit admin_course_path(@course)
    click_on "Delete quiz"
    expect(page).to have_content("Quiz deleted")
    expect(page).to_not have_content(@quiz.question)
  end

  scenario "Admin deletes a quiz from quiz's edit page" do
    visit edit_admin_course_quiz_path(@course, @quiz)
    click_on "Delete quiz"
    expect(page).to have_content("Quiz deleted")
    expect(page).to_not have_content(@quiz.question)
  end
end
