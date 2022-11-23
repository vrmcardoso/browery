# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'

puts "Cleaning database..."
Brewery.destroy_all
User.destroy_all

user = User.create(
  email: "vasco@gmail.com",
  password: "111111",
  username: "vasco",
  first_name: "Vasco",
  last_name: "Cardoso",
  address: "Le Wagon Lisboa"
)

brewery1 = Brewery.new(
  description: "SAGRES® ORIGINAL Our traditional beers, all ready for the party, with 100% natural ingredients to guarantee our traditional flavour.",
  name: "Sagres",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: user.id,
  address: "Av. da Liberdade n230",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)

photo_url = "https://executivedigest.sapo.pt/wp-content/uploads/2018/12/central_cervejas.jpg"
file = URI.open(photo_url)
brewery1.photos.attach(io: file, filename: "sagres", content_type: "image/jpg")
brewery1.save


brewery2 = Brewery.new(
  description: "Super Bock Original is the only Portuguese beer with 37 consecutive gold medals.",
  name: "SuperBook",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: user.id,
  address: "R. Artilharia 1 125-111",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)
photo_url = "https://www.esquerda.net/sites/default/files/styles/480y/public/29261711_1543279429114828_4515242768313876480_n.jpg?itok=NNzoLqqN"
file = URI.open(photo_url)
brewery2.photos.attach(io: file, filename: "superbock", content_type: "image/jpg")
brewery2.save

brewery3 = Brewery.new(
  description: "Corona is a brand of beer produced by Mexican brewery Cervecería Modelo and owned by Belgian company AB InBev.",
  name: "Corona",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: user.id,
  address: "Rua de S. Paulo 20",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)
photo_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7j9Nq0zVoHKWiu9OxSOOP-ZnbODn8qqrtBg&usqp=CAU"
file = URI.open(photo_url)
brewery3.photos.attach(io: file, filename: "corona", content_type: "image/jpg")
brewery3.save

brewery4 = Brewery.new(
  description: "Budweiser is a medium-bodied, flavorful, crisp American-style lager. It is brewed with the best barley malt and a blend of premium hop varieties.",
  name: "Budweiser",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: user.id,
  address: "R. Garrett 88, 1200-092 Lisboa",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)
photo_url = "http://nacaronadaale.com.br/wp-content/uploads/2018/08/st-5-e1533667220854.jpg"
file = URI.open(photo_url)
brewery4.photos.attach(io: file, filename: "budweiser", content_type: "image/jpg")
brewery4.save

brewery5 = Brewery.new(
  description: "Heineken Lager Beer is a pale lager beer with 5% alcohol by volume produced by the Dutch brewing company Heineken N.V. Heineken beer is sold in a green bottle with a red star.",
  name: "Heineken",
  price: rand(50.0..250.0).round(2),
  rating: rand(1.0..5.0).round(1),
  user_id: 12,
  address: "Calçada da Patriarcal 10-40",
  size: rand(500..2000),
  capacity: rand(1000..5000)
)
photo_url = "https://cms.heinekenexperience.com/images/uAPP6g8b1jYZ8dwekidTcreAYOE=/72/fill-779x779/Untitled-51.jpg?v=253f1d"
file = URI.open(photo_url)
brewery5.photos.attach(io: file, filename: "heineken", content_type: "image/jpg")
brewery5.save

puts "Finished!"
