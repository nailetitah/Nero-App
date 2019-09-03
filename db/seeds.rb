# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Training.destroy_all

6.times do 
  training = Training.create!(start_date: Faker::Date.forward(days: 365), title: "Training" )
end
puts "6 événéments ont été générés"

5.times do 
  faker_first_name = Faker::Name.first_name
  pwd = Faker::Internet.password
  user = User.create!(first_name: faker_first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email: "#{faker_first_name.downcase}@yopmail.com", password: pwd, password_confirmation: pwd, training_id: rand(1..6))
end
puts "5 utilisateurs ont été générés"

