desc "Send FSA "
task :send_fsa_email => :environment do
  Rails.logger.warn "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} Starting FSA Emails."

#  Notification.select_email_grouped_by_email("1w").each do |notification|
#      Rails.logger.warn "Process 1w notifications for email #{notification.email_to}"
#      notification.email_multi_notifications notification.email_to, "1w"
#  end



  Rails.logger.warn "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} Completed FSA Emails."
end