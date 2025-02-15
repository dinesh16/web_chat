# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:channel) { create(:channel) }
  let(:channel_user) { create(:channel_user, user: user, channel: channel) }
  let(:valid_attributes) { { content: 'Hello, world!' } }
  let(:invalid_attributes) { { content: '' } }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(channel_user.user)
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it "creates a new message" do
        expect {
          post :create, params: { channel_id: channel.id, message: valid_attributes }
        }.to change(Message, :count).by(1)
        expect(response).to have_http_status(:success)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new message' do
        expect {
          post :create, params: { channel_id: channel.id, message: invalid_attributes }
        }.not_to change(Message, :count)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
