require "rails_helper"

RSpec.describe Quiz, type: :model do
  it { should belong_to(:course) }
  it { should belong_to(:user) }


  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:right_answer) }
  it { should validate_presence_of(:response_A) }
end
