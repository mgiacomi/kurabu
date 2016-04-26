class NotificationMailer < ApplicationMailer
  def fsa signup
    @signup = signup
    mail(to: signup.email, subject: 'Kurabu Summer Camp 2016 Receipt')
  end
end
