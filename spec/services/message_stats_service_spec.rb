# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageStatsService, type: :service do
  include ActiveSupport::Testing::TimeHelpers  

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:channel) { create(:channel) }
  let(:channel_user) { create(:channel_user, user: user, channel: channel) }
  let(:other_channel_user) { create(:channel_user, user: other_user, channel: channel) }

  subject { described_class.new }

  describe '#grouped_messages' do
    before do
      travel_to Time.zone.local(2025, 2, 14, 10, 0, 0)

      create_list(:message, 3, channel_user: channel_user, created_at: 8.days.ago)
      create_list(:message, 2, channel_user: other_channel_user, created_at: 9.days.ago)
    end

    it 'groups messages count by user id' do
      row = subject.grouped_messages.filter { |row| row.user_id == channel_user.id }.first
      expect(row.user_id).to eq(channel_user.id)
      expect(row.message_count).to eq(3)
    end

    describe '#total_messages_sent' do
      it 'returns the total number of messages sent by the user' do
        count = subject.grouped_messages.select { |row| row.user_id == channel_user.id }.sum(&:message_count)
        expect(count).to eq(3)
      end
    end

    describe '#total_messages_received' do
      it 'returns the total number of messages received by the user' do
        expect(subject.total_messages_received(user.id)).to eq(2)
      end
    end
  end

  describe '#total_received_since_last_sent' do
    before do
      create(:message, channel_user: channel_user, created_at: 31.minutes.ago)
      create_list(:message, 4, channel_user: other_channel_user, created_at: 30.minutes.ago)
    end

    it 'returns the total number of messages received since last sent' do
      expect(subject.total_received_since_last_sent(user.id)).to eq(4)
    end
  end
end
