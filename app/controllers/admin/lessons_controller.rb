class Admin::LessonsController < ApplicationController

  def new
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new
  end

  def create
    @course = Course.find(params[:course_id])
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson added"
      redirect_to admin_course_path(@course)
    else
      flash[:alert] =  @lesson.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  protected

  def lesson_params
    params.require(:lesson).permit(:title, :course_id, :priority)
  end

end
