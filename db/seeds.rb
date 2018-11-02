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
  User.create(username:"b", email:"b@hotmail.com", password_digest: "hi")
  User.create(username:"c", email:"c@hotmail.com", password_digest: "hi")
puts "done making users"

puts "making assets"

  Asset.create(symbol: "BTCUSDT", name: "Bitcoin")
  Asset.create(symbol: "ETHUSDT", name: "Ethereum")
  Asset.create(symbol: "BCCUSDT", name: "Bitcoin Cash")
  Asset.create(symbol: "XRPUSDT", name: "Ripple")
  Asset.create(symbol: "LTCUSDT", name: "Litecoin")

puts "done making assets"



puts "making trades"
  Trade.create(user_id:6, asset_id: Asset.find_by(name: "Bitcoin").id, buy:true, price:5000, quantity:1)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:5050, quantity:1)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Bitcoin").id,buy:false, price:5000, quantity:3)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:6000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:7000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:8000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:2000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:3000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Bitcoin").id, buy:true, price:5000, quantity:5)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:6000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:6000, quantity:7)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:6000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:7000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:8000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:2000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:3000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:5000, quantity:5)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:6000, quantity:10)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:6000, quantity:7)
  Trade.create(user_id:6, asset_id:Asset.find_by(name: "Ethereum").id, buy:true, price:6000, quantity:10)

puts "done making trades"
