# frozen_string_literal: true

class MessageStatsService
  def initialize
    week_ago = 1.week.ago
    @beginning_of_week = week_ago.beginning_of_week
    @end_of_week = week_ago.end_of_week
  end

  def total_messages_sent(user_id)
    grouped_messages[user_id] || 0
  end

  def total_messages_received(user_id)
    grouped_messages.except(user_id).values.sum
  end

  def total_received_since_last_sent(user_id)
    last_sent_message = query.where(users: { id: user_id }).last
    last_sent_message ? query.where('messages.created_at > ?', last_sent_message.created_at).count : 0
  end

  private

  def query
    @query ||= Message.joins(channel_user: [ :user, :channel ])
  end

  def grouped_messages
    @grouped_messages ||= query
      .where(messages: { created_at: @beginning_of_week..@end_of_week })
      .unscope(:order)
      .group('users.id')
      .pluck('users.id', 'COUNT(messages.id)')
      .to_h
  end
end
