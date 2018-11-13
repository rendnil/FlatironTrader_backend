require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Trade.destroy_all
Asset.destroy_all


puts "making users"
  #User.create(username:"a", email:"a@hotmail.com", password_digest: "hi")


  20.times do
    User.create(username:Faker::GreekPhilosophers.name, email:"a@hotmail.com", password_digest: "hi")
  end

puts "done making users"

puts "making assets"

  Asset.create(symbol: "BTC", name: "Bitcoin")
  Asset.create(symbol: "ETH", name: "Ethereum")
  Asset.create(symbol: "BCH", name: "Bitcoin Cash")
  Asset.create(symbol: "XRP", name: "Ripple")
  Asset.create(symbol: "LTC", name: "Litecoin")

puts "done making assets"



puts "making trades"

  puts "making bitcoin trades"
    100.times do
      Trade.create(user_id:User.all.sample.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:rand(6300...6400), quantity:rand(1..100))
    end
    100.times do
      Trade.create(user_id:User.all.sample.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:false, price:rand(6300...6400), quantity:rand(1..100))
    end
  puts "done making bitcoin trades"





puts "done making trades"
