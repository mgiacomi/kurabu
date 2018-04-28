desc "Setup Sub Admin"
task :setup_sub_admin => :environment do

  puts "You will be prompted to enter an email address and password for the new admin"
  puts "Enter an email address:"
  email = STDIN.gets
  password = SecureRandom.urlsafe_base64(6)
  unless email.strip!.blank? || password.strip!.blank?
    if User.create!(email: email, password: password)
      puts "User created successfully."
    else
      puts "Sorry, user not created!"
    end
  end

end