# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  first_name: "Pablo",
  last_name: "Ledesma",
  email: "bla@email.com",
  password: "12345678",
  role: "Admin"
)

12.times do
  Course.create(
    title: Faker::Name.title,
    description: Faker::Lorem.paragraph,
    duration: Faker::Number.number(2),
    price: Faker::Number.number(2)
  )
end
