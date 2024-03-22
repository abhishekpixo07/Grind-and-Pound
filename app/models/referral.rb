# app/models/referral.rb
class Referral < ApplicationRecord
  belongs_to :referrer, class_name: 'User', optional: true
  belongs_to :referred_user, class_name: 'User', optional: true

  # validates :email, uniqueness: true

  before_validation :normalize_email

  private

  def normalize_email
    self.email = email.downcase.strip if email.present?
  end
end