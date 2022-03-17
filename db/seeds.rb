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
user = User.create(email: 'tricia.waineo@oyanokai.org', password: password, admin: 1)
puts "Created Admin: #{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'kurabu@oyanokai.org', password: password)
puts "Created Kurabu Admin: #{user.email} #{password}"

password = SecureRandom.urlsafe_base64(6)
user = User.create(email: 'kurabu.assistant@oyanokai.org', password: password)
puts "Created Assistant: #{user.email} #{password}"
