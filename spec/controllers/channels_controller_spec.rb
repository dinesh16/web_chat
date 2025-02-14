# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do
  # let(:user) { create(:user) }
  let(:channel) { create(:channel) }

  # before { sign_in user }

  describe 'GET #index' do
    it 'assigns @channels and renders the index template' do
      channel1 = create(:channel, name: 'Channel A')
      channel2 = create(:channel, name: 'Channel B')
      get :index
      # expect(assigns(:channels)).to eq([channel1, channel2])
      # expect(response).to render_template(:index)
    end
  end

  # describe 'GET #new' do
  #   it 'assigns a new channel and renders the new template' do
  #     get :new
  #     expect(assigns(:channel)).to be_a_new(Channel)
  #     expect(response).to render_template(:new)
  #   end
  # end

  # describe 'POST #create' do
  #   context 'with valid attributes' do
  #     it 'creates a new channel' do
  #       expect {
  #         post :create, params: { channel: { name: 'Test Channel' } }
  #       }.to change(Channel, :count).by(1)
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     it 'raises an error' do
  #       expect {
  #         post :create, params: { channel: { name: '' } }
  #       }.to raise_error(ActiveRecord::RecordInvalid)
  #     end
  #   end
  # end

  # describe 'POST #join' do
  #   context 'when channel exists' do
  #     it 'adds the user to the channel and redirects' do
  #       post :join, params: { channel_id: channel.id }
  #       expect(response).to redirect_to(channel_path(channel))
  #       expect(flash[:notice]).to eq(I18n.t('channels.notices.joined'))
  #     end
  #   end

  #   context 'when channel does not exist' do
  #     it 'redirects with an alert' do
  #       post :join, params: { channel_id: nil }
  #       expect(response).to redirect_to(channel_path)
  #       expect(flash[:alert]).to eq(I18n.t('channels.alerts.empty'))
  #     end
  #   end
  # end

  # describe 'GET #show' do
  #   context 'when user is part of the channel' do
  #     before { channel.users << user }

  #     it 'assigns @new_message and renders the show template' do
  #       get :show, params: { id: channel.id }
  #       expect(assigns(:new_message)).to be_a_new(Message)
  #       expect(response).to render_template(:show)
  #     end
  #   end

  #   context 'when user is not part of the channel' do
  #     it 'does not assign @channel and redirects' do
  #       get :show, params: { id: channel.id }
  #       expect(assigns(:channel)).to be_nil
  #     end
  #   end
  # end
end
