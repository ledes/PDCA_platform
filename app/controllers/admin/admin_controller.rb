class Admin::AdminController < Admin::CoursesController
  before_action :admin_only!

  def admin_only!
    if !current_user.admin?
      redirect_to root_path
    end
  end
end
