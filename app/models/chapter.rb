class Chapter < ActiveRecord::Base
  belongs_to :lesson

  validates :lesson_id, presence: true
  validates :body, presence: true
end
