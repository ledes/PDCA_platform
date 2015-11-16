require "rails_helper"

RSpec.describe Course, type: :model do
  it { should have_many(:lessons) }
  it { should have_many(:course_users) }
  it { should have_many(:users).through(:course_users) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }


    it "returns a sorted array of courses that match" do
      course1 = Course.create(
        title: "Management",
        description: Faker::Lorem.paragraph
      )
      course2 = Course.create(
        title: "Lean",
        description: "Great course about management"
      )
      course2 = Course.create(
        title: Faker::Name.title,
        description: Faker::Lorem.paragraph
      )
      expect(Course.search("management")) == [course1, course2]
    end
end
