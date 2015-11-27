class Quizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :question, null: false
      t.string :right_answer, null: false
      t.string :response_A, null: false
      t.string :response_B
      t.string :response_C
      t.string :response_D
      t.belongs_to :user, null: false
      t.belongs_to :course_id, null: false
    end
  end
end
