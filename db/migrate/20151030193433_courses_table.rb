class CoursesTable < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :duration
      t.string :price
    end
  end
end
