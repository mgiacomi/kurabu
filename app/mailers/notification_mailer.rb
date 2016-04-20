class NotificationMailer < ApplicationMailer
  def fsa()
    @user = user
    @url  = 'http://example.com/login'
    mail(to: 'mgiacomi@gltech.com', subject: 'Kurabu test email.')
  end
end
