class LessonsController < ApplicationController
  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    @chapters = @lesson.chapters
    if current_user.nil?
      flash[notice] = "You need to sign in first!"
      redirect_to course_path(@course)
    elsif !current_user.courses.include?(@course)
      flash[notice] = "You need to join the course first!"
      redirect_to course_path(@course)
    end
  end
end
