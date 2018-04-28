desc "Setup User"
task :setup_user => :environment do

  password = SecureRandom.urlsafe_base64(6)
  user = User.create(email: 'yoshietomita@gmail.com', password: password)
  puts "Created Yoshie: #{user.email} #{password}"

end