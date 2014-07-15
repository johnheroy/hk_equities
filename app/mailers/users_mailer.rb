class UsersMailer < ActionMailer::Base
  default from: "newuser@hkequiti.es"

  def new_user(user)
  	@user = user

 	mail to: "johnheroy@gmail.com", subject: "New User @ HK Equities"
  end
end
