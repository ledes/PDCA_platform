class CoursesUsersTable < ActiveRecord::Migration
  def change
    create_table :course_users do |t|
      t.belongs_to :user, null: false
      t.belongs_to :course, null: false
    end
  end
end
