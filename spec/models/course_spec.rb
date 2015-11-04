require "rails_helper"

RSpec.describe Course, type: :model do
  it { should have_many(:lessons) }
  it { should have_many(:course_users) }
  it { should have_many(:users).through(:course_users) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
end
