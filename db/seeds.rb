# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pablo = User.create(
  first_name: "Pablo",
  last_name: "bla",
  email: "bla@email.com",
  password: "12345678",
  role: "Admin"
)

user2 = User.create(
  first_name: "user",
  last_name: "ble",
  email: "ble@email.com",
  password: "12345678",
)

12.times do
  Course.create(
    title: Faker::Name.title,
    description: Faker::Lorem.paragraph,
    duration: Faker::Number.number(2),
    price: Faker::Number.number(2)
  )
  CourseUser.create(
    user: user2,
    course: Course.last
  )
  4.times do
    Lesson.create(
      title: Faker::Name.title,
      course: Course.last,
      priority: 1
    )
  end
  4.times do
    b = Faker::Name.title
    Quiz.create(
      question: Faker::Name.title,
      right_answer: b,
      response_A: b,
      response_B: Faker::Name.title,
      user: user2,
      course: Course.last
    )
  end
end
