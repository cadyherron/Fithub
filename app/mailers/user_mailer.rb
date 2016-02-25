class UserMailer < ApplicationMailer
  default from: "welcome@fithub.com"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Fithub!")
  end
  
end
