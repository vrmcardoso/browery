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
puts "Done"


user = User.create(
email: "vascocorreia99@gmail.com",
password: "123456",
username: "hotsoup",
first_name: "Vasco",
last_name: "Correia",
address: "rua da flores, n23 Madeira"
)

Brewery.create(
  description: "SAGRES® ORIGINAL Our traditional beers, all ready for the party, with 100% natural ingredients to guarantee our traditional flavour.",
  name: "Sagres",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: user.id,
  address: "Av. da Liberdade n230",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)

Brewery.create(
  description: "Super Bock Original is the only Portuguese beer with 37 consecutive gold medals.",
  name: "SuperBook",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: user.id,
  address: "R. Artilharia 1 125-111",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)

Brewery.create(
  description: "Corona is a brand of beer produced by Mexican brewery Cervecería Modelo and owned by Belgian company AB InBev.",
  name: "Corona",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: user.id,
  address: "Rua de S. Paulo 20",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)

Brewery.create(
  description: "Budweiser is a medium-bodied, flavorful, crisp American-style lager. It is brewed with the best barley malt and a blend of premium hop varieties.",
  name: "Budweiser",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: user.id,
  address: "R. Garrett 88, 1200-092 Lisboa",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)

Brewery.create(
  description: "Heineken Lager Beer is a pale lager beer with 5% alcohol by volume produced by the Dutch brewing company Heineken N.V. Heineken beer is sold in a green bottle with a red star.",
  name: "Heineken",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: 12,
  address: "Calçada da Patriarcal 10-40",
  size: rand(500..2000),
  capacity: rand(1000..5000)
) =end

puts "Finished!"
