class Admin::LessonsController < ApplicationController

  def new
    @lesson = Lesson.new
  end

  def create
    @course = Course.find(params[:id])
    @lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson added"
      redirect_to admin_course_path(@course)

    else
      flash[:alert] = "Something went wrong"
      redirect_to :back
    end
  end

  protected

  def lesson_params
    params.require(:lesson).permit(:title, :course_id, :priority)
  end

end
