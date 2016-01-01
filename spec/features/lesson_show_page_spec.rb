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
    @lesson2 = FactoryGirl.create(:lesson, course_id: @course.id)
    @chapter1 = FactoryGirl.create(:chapter, lesson_id: @lesson.id)
    @chapter2 = FactoryGirl.create(:chapter, lesson_id: @lesson.id)
    @chapter_1 = FactoryGirl.create(:chapter, lesson_id: @lesson2.id)
    login(user)
  end

  scenario "user has to join the course to be able to visit the lessons" do
    visit course_lesson_path(@course, @lesson)
    expect(page).to have_content("You need to join the course first!")

    click_on("Join course")
    visit course_lesson_path(@course, @lesson)
    expect(page).to have_content(@chapter1.body)
  end

  scenario "user visits lesson show page" do
    visit course_lesson_path(@course, @lesson)
    expect(page).to have_content(@lesson.title)
  end

  scenario "User sees all the lessons for the course" do
    visit course_path(@course)
    expect(page).to have_content(@lesson.title)
    expect(page).to have_content(@lesson2.title)

    visit course_lesson_path(@course, @lesson)
    expect(page).to have_content(@lesson.title)
    expect(page).to have_content(@lesson2.title)
  end

  scenario "Users sees all the chapters for a lesson" do
    visit course_path(@course, @lesson)
    click_on("Join course")
    visit course_lesson_path(@course, @lesson)
    expect(page).to have_content(@chapter1.body)
    expect(page).to have_content(@chapter2.body)
  end

  scenario "User sees the right buttons for the quiz or next/previous lesson" do
    visit course_path(@course, @lesson)
    click_on("Join course")
    visit course_lesson_path(@course, @lesson)
    expect(page).to_not have_css('#previousButton')
    expect(page).to have_css('#nextButton')
    expect(page).to_not have_css('#quizButton')

    visit course_lesson_path(@course, @lesson2)
    expect(page).to have_css('#previousButton')
    expect(page).to_not have_css('#nextButton')
    expect(page).to have_css('#quizButton')
  end

  scenario "User clicks on next/previous lesson button" do
    visit course_path(@course, @lesson)
    click_on("Join course")
    visit course_lesson_path(@course, @lesson)

    click_link("nextButton")
    expect(page).to have_content(@chapter_1.body)

    click_link("previousButton")
    expect(page).to have_content(@chapter1.body)
    expect(page).to have_content(@chapter2.body)
  end
end
