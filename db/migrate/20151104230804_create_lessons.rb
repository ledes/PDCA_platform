class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title, null: false
      t.belongs_to :course, null: false
    end
  end
end
