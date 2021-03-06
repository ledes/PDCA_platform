class Quiz < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  validates :course_id, presence: true
  validates :question, presence: true
  validates :right_answer, presence: true
  validates :response_A, presence: true
  validates :response_B, presence: true
  validates :taken?, default: false
  validates :pass?, default: false
end
