# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  include Devise::Test::ControllerHelpers

  describe 'GET #index' do
    describe 'when not signed in' do
      it 'returns http success' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    describe 'when signed in' do
      before do
        allow(controller).to receive(:authenticate_user!).and_return(true)
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
