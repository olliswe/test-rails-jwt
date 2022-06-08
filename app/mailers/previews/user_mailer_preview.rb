class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    UserMailer.with(user_profile: User.first.user_profile).welcome_email
  end
end