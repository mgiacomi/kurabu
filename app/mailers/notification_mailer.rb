class NotificationMailer < ApplicationMailer
  def fsa signup
    @signup = signup
    mail(to: signup.email, subject: 'Kurabu Summer Camp 2022 Receipt')
  end
end
