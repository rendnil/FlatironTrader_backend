require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#User.destroy_all
Trade.destroy_all
Asset.destroy_all


puts "making users"
  User.create(username:"a", email:"a@hotmail.com", password_digest: "hi")


  20.times do
    User.create(username:Faker::GreekPhilosophers.name, email:"b@hotmail.com", password_digest: "hi")
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
  Trade.create(user_id:User.all.last.id, asset_id: Asset.find_by(name: "Bitcoin").id, buy:true, price:5000, quantity:1)
  Trade.create(user_id:User.all.last.id, asset_id: Asset.find_by(name: "Bitcoin").id, buy:true, price:6000, quantity:1)
  Trade.create(user_id:User.all.last.id, asset_id: Asset.find_by(name: "Bitcoin").id, buy:false, price:6000, quantity:1)
  Trade.create(user_id:User.all.last.id, asset_id: Asset.find_by(name: "Ethereum").id, buy:true, price:200, quantity:1)
  Trade.create(user_id:User.all.last.id, asset_id: Asset.find_by(name: "Ethereum").id, buy:true, price:210, quantity:1)
  Trade.create(user_id:User.all.last.id, asset_id: Asset.find_by(name: "Ethereum").id, buy:true, price:220, quantity:1)
  Trade.create(user_id:User.all.last.id, asset_id: Asset.find_by(name: "Ethereum").id, buy:true, price:200, quantity:1)

  Trade.create(user_id:User.all.first.id, asset_id: Asset.find_by(name: "Bitcoin").id, buy:true, price:5000, quantity:1)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:5050, quantity:1)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Bitcoin").id,buy:false, price:5000, quantity:3)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:6000, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:7000, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:8000, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:2000, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:3000, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:5000, quantity:5)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:200, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:200, quantity:7)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:200, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:220, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:230, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:199, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:201, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:202, quantity:5)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:200, quantity:10)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:200, quantity:7)
  Trade.create(user_id:User.all.first.id, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:200, quantity:10)


  100.times do
    Trade.create(user_id:User.all.sample.id, asset_id:Asset.all.sample.id, buy:true, price:rand(1..100), quantity:rand(1..100))
  end


puts "done making trades"
