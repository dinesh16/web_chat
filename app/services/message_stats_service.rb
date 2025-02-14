# frozen_string_literal: true

class MessageStatsService
  def initialize
    @beginning_of_week = 1.week.ago.beginning_of_week.to_s
    @end_of_week = 1.week.ago.end_of_week.to_s
  end

  def total_messages_sent(user_id)
    grouped_messages.select { |m| m['user_id'] == user_id }.sum { |m| m['message_count'] }
  end

  def total_messages_received(user_id)
    grouped_messages.reject { |m| m['user_id'] == user_id }.sum { |m| m['message_count'] }
  end

  def total_received_since_last_sent(user_id)
    user_last_message = query.where('users.id = ?', user_id).order(created_at: :desc).first
    other_messages = query.where('messages.created_at > ?', user_last_message.created_at).count
  end

  def user_last_message(user_id)
    Message.joins(channel_user: [ :user, :channel ]).where('users.id = ?', user_id).order(created_at: :desc).first
  end

  def query
    @query ||= Message.joins(channel_user: [ :user, :channel ])
  end

  def grouped_messages
    @grouped_messages ||= query.where(created_at: @beginning_of_week..@end_of_week)
                               .select('users.id AS user_id, COUNT(messages.id) AS message_count')
                               .group('users.id').as_json
  end
end
