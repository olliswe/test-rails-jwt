class UserMailer < ApplicationMailer
  def welcome_email
    @user_profile = params[:user_profile]
    mail(to:'foo@bar.com', subject:"Hello #{@user_profile.first_name}")
  end
end
