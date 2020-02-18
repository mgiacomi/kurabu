class NotificationMailer < ApplicationMailer
  def fsa signup
    @signup = signup
    mail(to: signup.email, subject: 'Kurabu Summer Camp 2020 Receipt')
  end
end
