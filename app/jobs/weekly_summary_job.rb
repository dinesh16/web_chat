# frozen_string_literal: true

class WeeklySummaryJob < ApplicationJob
  queue_as :default

  def perform
    User.find_each do |user|
      last_week = 1.week.ago.beginning_of_week..1.week.ago.end_of_week

      messages_sent = user.messages.where(created_at: last_week).count
      messages_received = Message.where(receiver_id: user.id, created_at: last_week).count

      last_sent_message = user.messages.order(created_at: :desc).first
      total_received_since_last_sent = if last_sent_message
        Message.where(receiver_id: user.id)
               .where('created_at > ?', last_sent_message.created_at)
               .count
      else
        Message.where(receiver_id: user.id).count
      end

      UserMailer.weekly_summary(user, messages_sent, messages_received, total_received_since_last_sent).deliver_later
    end
  end
end
