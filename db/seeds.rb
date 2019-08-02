# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

100.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end
puts "upto 100 records inserted into users table!"


100.times do
  Employee.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end
puts "upto 100 records inserted into employees table!"


100.times do
  Student.create(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    phone_number: Faker::PhoneNumber.cell_phone
  )
end
puts "upto 100 records inserted into students table!"