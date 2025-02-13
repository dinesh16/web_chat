# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:channel_user) }
  end

  describe 'callbacks' do
    let(:channel) { create(:channel) }
    let(:user) { create(:user) }
    let(:message) { build(:message, channel_user: create(:channel_user)) }

    it 'broadcasts message after create' do
      expect(message).to receive(:broadcast_message)
      message.save
    end

    describe '#broadcast_message' do
      let(:channel_user) { create(:channel_user) }
      let(:message) { create(:message, channel_user: channel_user) }

      it 'calls broadcast_append_to with correct parameters' do
        expect(message).to receive(:broadcast_append_to).with(
          "channel_#{channel_user.channel_id}",
          target: 'messages',
          partial: 'messages/message',
          locals: { message: message }
        )
        message.broadcast_message
      end
    end
  end
end
