# frozen_string_literal: true

class WeeklySummaryJob < ApplicationJob
  queue_as :default

  def perform
    stat_service = MessageStatsService.new

    stat_service.grouped_messages.each do |grouped_message|
      user = User.find(grouped_message.user_id)

      messages_sent = grouped_message.message_count
      messages_received = stat_service.total_messages_received(user.id)
      total_received_since_last_sent = stat_service.total_received_since_last_sent(user.id)

      UserMailer.weekly_summary(user, messages_sent, messages_received, total_received_since_last_sent).deliver_now
    end
  end
end
