class ChangeLessons < ActiveRecord::Migration
  def change
    add_column :lessons, :priority, :integer, null: false
  end
end
