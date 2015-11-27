class Admin::QuizzesController < ApplicationController
  def show
    @course = Course.find(params[:course_id])
    @quiz = Quiz.find(params[:id])
  end

  def new
    @course = Course.find(params[:course_id])
    @quiz = Quiz.new
  end

  def create
    @course = Course.find(params[:course_id])
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      flash[:notice] = "Quiz added"
      redirect_to admin_course_path(@course)
    else
      flash[:alert] =  @quiz.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @quiz = Quiz.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @quiz = Quiz.find(params[:id])
    if @quiz.update_attributes(quiz_params)
      flash[:success] = "Quiz edited successfully"
      redirect_to admin_course_path(@course)
    else
       flash[:alert] = @quiz.errors.full_messages.to_sentence
       render :edit
    end
  end

  def destroy
    @course = Course.find(params[:course_id])
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    flash[:notice] = "Quiz deleted"
    redirect_to admin_course_path(@course)
  end
  protected

  def quiz_params
    params.require(:quiz).permit(
      :course_id,
      :user_id,
      :question,
      :right_answer,
      :response_A,
      :response_B,
      :response_C,
      :response_D,
      :taken?,
      :pass?
    )
  end
end
