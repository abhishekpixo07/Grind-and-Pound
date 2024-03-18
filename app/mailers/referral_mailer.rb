# app/mailers/referral_mailer.rb
class ReferralMailer < ApplicationMailer
    def refer_email(email)
      mail(to: email, subject: 'You have been referred!')
    end
  
    def refer_accepted_email(referrer, referred_user)
      @referrer = referrer
      @referred_user = referred_user
      mail(to: referrer.email, subject: 'Your referral has signed up!')
    end
end
  