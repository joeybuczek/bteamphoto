# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview
  def invitation_email_preview
    InvitationMailer.invitation_email(User.last, 'PREVIEW_MODE')
  end
end
