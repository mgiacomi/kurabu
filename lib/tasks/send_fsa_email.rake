desc "Send FSA Email"
task :send_fsa_email => :environment do
  puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} Starting FSA Emails."

  payments = Payment.where('receipt_date is null').each do |payment|
      puts "Processing receipt for email #{payment.signup.email}"

#  NotificationMailer.fsa('mgiacomi@gltech.com').deliver

    payment.receipt_date = Time.now
    payment.save
  end

  puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} Completed FSA Emails."
end