class Quiz < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :course_id, presence: true
  validates :user_id, presence: true
  validates :question, presence: true
  validates :right_answer, presence: true
  validates :response_A, presence: true

end
