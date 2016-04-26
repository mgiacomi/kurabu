desc "Send FSA Email"
task :send_fsa_email => :environment do
  puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} Starting FSA Emails."

  payments = Payment.where('receipt_date is null').each do |payment|
    if !payment.signup.nil? && payment.signup.amt_due == 0
      puts "Processing receipt for email #{payment.signup.email}"

      NotificationMailer.fsa(payment.signup).deliver

      payment.receipt_date = Time.now
      payment.save
    end
  end

####### JUST FOR TESTING #############
#signup = Signup.find(6)
#NotificationMailer.fsa(signup).deliver
######################################

  puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} Completed FSA Emails."
end