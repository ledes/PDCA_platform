require "rails_helper"

RSpec.describe Lesson, type: :model do
  it { should belong_to(:course) }
  it { should have_many(:chapters) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:course_id) }
  it { should validate_presence_of(:priority) }
end
