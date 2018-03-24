class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Please confirm your Blocmetrics account."
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "There is a password reset request on your Blocmetric account."
  end

end
