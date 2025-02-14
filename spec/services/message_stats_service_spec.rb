# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageStatsService, type: :service do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:channel) { create(:channel) }
  let(:channel_user) { create(:channel_user, user: user, channel: channel) }
  let(:other_channel_user) { create(:channel_user, user: other_user, channel: channel) }

  before do
    create_list(:message, 3, channel_user: channel_user, created_at: 9.days.ago)
    create_list(:message, 2, channel_user: other_channel_user, created_at: 10.days.ago)
  end

  subject { described_class.new }

  describe '#total_messages_sent' do
    it 'returns the total number of messages sent by the user' do
      expect(subject.total_messages_sent(user.id)).to eq(3)
    end
  end

  describe '#total_messages_received' do
    it 'returns the total number of messages received by the user' do
      expect(subject.total_messages_received(user.id)).to eq(2)
    end
  end

  describe '#total_received_since_last_sent' do
    before do
      create(:message, channel_user: channel_user, created_at: 1.hour.ago)
      create_list(:message, 4, channel_user: other_channel_user, created_at: 30.minutes.ago)
    end

    it 'returns the total number of messages received since last sent' do
      expect(subject.total_received_since_last_sent(user.id)).to eq(4)
    end
  end

  describe '#user_last_message' do
    let!(:latest_message) { create(:message, channel_user: channel_user, created_at: 1.hour.ago) }

    it 'returns the last message sent by the user' do
      expect(subject.user_last_message(user.id)).to eq(latest_message)
    end
  end
end
