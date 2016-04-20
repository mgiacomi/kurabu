class NotificationMailer < ApplicationMailer
  def fsa to_email
    mail(to: to_email, subject: 'Kurabu Summer Camp Receipt')
  end
end
