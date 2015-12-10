class CourseUsersController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @course_user = CourseUser.new(course_user_params)
    if !current_user.courses.include?(@course)
      if @course_user.save
        flash[:notice] = "You can start the course now"
          redirect_to :back
      else
        flash[:errors] = "Something went wrong!"
          redirect_to :back
      end
    else
      flash[:notice] = "You have already joined"
        redirect_to :back
    end
  end

  protected

  def course_user_params
    params.require(:course_user).permit(
      :user_id,
      :course_id
    )
  end
end
