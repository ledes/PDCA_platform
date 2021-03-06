class CoursesController < ApplicationController

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

end
