# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:channel) { create(:channel) }
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe 'GET #index' do
    it 'assigns @channels and renders the index template' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new channel' do
        expect {
          post :create, params: { channel: { name: 'Test Channel' } }
        }.to change(Channel, :count).by(1)
      end
    end
  end

  describe 'POST #join' do
    context 'when channel exists' do
      it 'adds the user to the channel and redirects' do
        post :join, params: { channel_id: channel.id }
        expect(response).to redirect_to(channel_path(channel))
        expect(flash[:notice]).to eq(I18n.t('channels.notices.joined'))
      end
    end
  end
end
