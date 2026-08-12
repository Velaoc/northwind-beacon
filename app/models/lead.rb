# frozen_string_literal: true

# A waitlist signup captured from the landing page. Emails are stored
# normalized (downcased, stripped) and unique; the original casing is kept
# for display.
class Lead < ApplicationRecord
  before_validation :normalize_email

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
    uniqueness: { case_sensitive: false }
  validates :email_normalized, presence: true, uniqueness: true

  private

  def normalize_email
    self.email = email.to_s.strip
    self.email_normalized = email.downcase
  end
end
