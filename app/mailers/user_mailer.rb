# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def weekly_summary(user, messages_sent, messages_received, total_received_since_last_sent)
    @user = user
    @messages_sent = messages_sent
    @messages_received = messages_received
    @total_received_since_last_sent = total_received_since_last_sent

    mail(to: @user.email, subject: 'Your Weekly Message Summary')
  end
end
