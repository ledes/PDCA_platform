require 'rails_helper'

RSpec.describe CoursesUser, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:course) }

end
