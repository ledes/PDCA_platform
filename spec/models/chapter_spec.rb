require "rails_helper"

RSpec.describe Chapter, type: :model do
  it { should belong_to(:lesson) }

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:lesson_id) }
end
