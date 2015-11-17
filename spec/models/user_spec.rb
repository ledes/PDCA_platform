require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:course_users) }
  it { should have_many(:courses).through(:course_users) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:role) }

  describe "#search()" do
    it "returns a sorted array of users that match" do
      sam = FactoryGirl.create(
        :user,
        email: "workingjoe@yahoo.com",
        first_name: "Sam"
      )
      joe = FactoryGirl.create(
        :user,
        first_name: "Joe"
      )
      nick = FactoryGirl.create(
        :user,
        first_name: "Nick",
        last_name: "Samuels"
      )
      expect(User.search("joe")) == [sam, joe]
    end
  end

  describe "#admin?" do
    describe "WHEN the user isn't an admin" do
      it "IT returns false" do
        user = FactoryGirl.create(:user)
        expect(user.admin?).to be_falsey
      end
    end
    describe "WHEN the user is an admin" do
      it "IT returns true" do
        user = FactoryGirl.create(:user, role: "Admin")
        expect(user.admin?).to be_truthy
      end
    end
  end
end
