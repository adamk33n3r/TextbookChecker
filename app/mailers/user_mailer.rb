class UserMailer < ActionMailer::Base
  default from: "adam_keenan@taylor.edu"
  def verify_email(user)
    @user = user
    l = @user.username.split('_')
    @first = l[0]
    @last = l[1]
    @url = ""
    mail :to => @user.email, :subject => "Welcome to TextbookChecker, #{@first}. Please verify your email!"
  end
end
