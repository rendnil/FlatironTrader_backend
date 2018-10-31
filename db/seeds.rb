# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# User.destroy_all
# Trade.destroy_all


puts "making users"
  # User.create(username:"a1", email:"a@msn.com", password_digest: "hi")
puts "done making users"




puts "making trades"
  Trade.create(user_id:2, symbol:"BTCUSDT",buy:true, price:5000, quantity:0.5)
  Trade.create(user_id:2, symbol:"BTCUSDT",buy:true, price:5050, quantity:1)
  Trade.create(user_id:2, symbol:"BTCUSDT",buy:false, price:5050, quantity:3)
  Trade.create(user_id:2, symbol:"BTCUSDT",buy:true, price:6000, quantity:10)

puts "done making trades"
