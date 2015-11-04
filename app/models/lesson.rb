class Lesson < ActiveRecord::Base
  belongs_to :course
  has_many :chapters

  validates :course_id, presence: true
  validates :title, presence: true

end
