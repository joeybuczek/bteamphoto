class InvitationsController < ApplicationController
  
  def create
    # create invitation for user - token generated before_create - see model
    @user = User.find(params[:id])
    # generate new random password for user
    @temporary_password = SecureRandom.hex(4)
    @user.update_attributes(password: @temporary_password, password_confirmation: @temporary_password)
    # build the invitation
    @invitation = @user.invitations.build
    @invitation.save
    # send invitation_email
    InvitationMailer.invitation_email(@user, @temporary_password).deliver
    redirect_to request.referrer
  end
  
  def confirmation
    # Locate user by invitation token
    @invitation = Invitation.find_by_token(params[:token])
    @user = @invitation.user
    
    unless @user.nil?
      # User found
      redirect_to new_user_session_path
    else
      # User not found
      flash[:error] = "This invitation is no longer valid. Please log in or contact us at bteamphoto@gmail.com for assistance."
      redirect_to root_path
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.invitations.count > 0 then @user.invitations.destroy_all end
    redirect_to client_landing_path
  end
  
end
