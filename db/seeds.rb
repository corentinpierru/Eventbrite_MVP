# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Event.destroy_all
User.destroy_all
Participation.destroy_all


50.times do
  #Faker pour email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{first_name}.#{last_name}@yopmail.com",
    password: Faker::Lorem.characters(number: 10),
    
  )
end

5.times do
  Event.create!(
    start_date: Faker::Date.forward,
    duration: 60,
    title: Faker::Book.title,
    description: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 20),
    price:  Faker::Number.between(from: 1, to: 2000),
    location: Faker::Address.city,
    administrator: User.find(rand(User.first.id..User.last.id))
  )
end

50.times do
  Participation.create!(
    attendee: User.find(rand(User.first.id..User.last.id)),
    event: Event.find(rand(Event.first.id..Event.last.id))
  )
end