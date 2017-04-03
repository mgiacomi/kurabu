desc "Setup Ryoko"
task :setup_ryoko => :environment do
  password = SecureRandom.urlsafe_base64(6)
  user = User.create(email: 'ryokorollin@gmail.com', password: password)
  puts "Created Ryoko: #{user.email} #{password}"
end