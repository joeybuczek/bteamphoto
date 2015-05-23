class InvitationMailer < ActionMailer::Base
  default from: "bteamphoto@gmail.com"
  
  def invitation_email(user, temporary_password)
    @user = user
    @temporary_password = temporary_password
    @token = @user.invitations.last.token
    @url = "https://bteamphoto.herokuapp.com/confirmation?token=#{@token}"
    mail(to: @user.email, subject: 'B-Team Photography Account Setup Confirmation')
  end
  
end
