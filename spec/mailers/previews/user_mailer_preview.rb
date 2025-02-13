# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/user_mailer_mailer
class UserMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer_mailer/weekly_summary
  def weekly_summary
    UserMailer.weekly_summary
  end
end
