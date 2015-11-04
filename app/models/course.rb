class Course < ActiveRecord::Base
  has_many :lessons
  has_many :course_users
  has_many :users, through: :course_users

  validates :title, presence: true
  validates :description, presence: true
end
