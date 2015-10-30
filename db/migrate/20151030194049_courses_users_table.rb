class CoursesUsersTable < ActiveRecord::Migration
  def change
    create_table :courses_users do |t|
      t.references :user, null: false
      t.references :course, null: false
    end
  end
end
