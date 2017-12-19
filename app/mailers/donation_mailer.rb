class DonationMailer < ApplicationMailer
  def created_notification(donation, user)
    @donation = donation
    @user = user
    mail(to: @user.email, subject: I18n.t('donation.mailer.created_notification.subject'))
  end
end
