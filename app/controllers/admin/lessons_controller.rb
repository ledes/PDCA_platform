class Admin::LessonsController < ApplicationController
  def show
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    @chapters = @lesson.chapters

  end

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

  def edit
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      flash[:success] = "Lesson edited successfully"
      redirect_to admin_course_path(@course)
    else
       flash[:alert] = @lesson.errors.full_messages.to_sentence
       render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    flash[:notice] = "Lesson deleted"
    redirect_to admin_course_path(@course)
  end
  protected

  def lesson_params
    params.require(:lesson).permit(:title, :course_id, :priority)
  end

end
