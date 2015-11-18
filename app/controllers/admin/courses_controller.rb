class Admin::CoursesController < ApplicationController

  def index
    n_page = params[:page]
    if params[:search]
      search = params[:search]
      @courses = Course.search(search).order("title").page(n_page).per(10)
    else
      @courses = Course.order("title").page(n_page).per(10)
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:notice] = "Course created"
      redirect_to admin_courses_path
    else
      flash[:errors] = "Something went wrong!"
      redirect_to new_admin_course_path
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Course edited successfully"
      redirect_to admin_course_path(@course)
    else
       flash[:alert] = "Something went wrong"
       render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = "Course deleted"
    redirect_to admin_courses_path
  end

  protected

  def course_params
    params.require(:course).permit(:title, :description, :duration, :price)
  end
end
