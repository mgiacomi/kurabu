# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'mgiacomi@gltech.com', password: password, admin: 1)
puts "Created Admin: #{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'kblack@pdx.edu', password: password, admin: 1)
puts "Created Admin: #{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'ryokorollin@gmail.com', password: password)
puts "Created Ryoko: #{user.email} #{password}"
