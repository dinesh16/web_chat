# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :channel_user
  validates :content, presence: true

  after_create :broadcast_message
  default_scope { order(created_at: :asc) }

  def broadcast_message
    broadcast_append_to(
      "channel_#{channel_user.channel_id}",
      target: 'messages',
      partial: 'messages/message',
      locals: { message: self }
    )
  end
end
