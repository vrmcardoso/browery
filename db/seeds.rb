# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Cleaning database..."
Brewery.destroy_all
User.destroy_all

# 5.times do
#   User.create(
#   email: Faker::Internet.email,
#   password: Faker::Internet.password,
#   username: Faker::Internet.username(specifier: 5..8),
#   first_name: Faker::Name.first_name,
#   last_name: Faker::Name.last_name,
#   address: Faker::Address.full_address
#   )
# end

# 10.times do
#   Brewery.create(
#     description: Faker::Lorem.paragraph(sentence_count: rand(6..12)),
#     name: Faker::Beer.brand,
#     price: rand(50.0..250.0).round(2),
#     rating: rand(1.0..5.0).round(1),
#     user_id: rand(1..5),
#     address: Faker::Address.full_address,
#     size: rand(500..2000),
#     capacity: rand(1000..5000)
#   )
# end


puts "Finished!"
