class UserMailer < ApplicationMailer
  default from: 'foodforthoughtasap@gmail.com'

  def send_email(email,token)
    @token = token
    mail(to: email, subject: 'Food Delivery Update')
  end
end
