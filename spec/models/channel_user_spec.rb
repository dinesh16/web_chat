# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChannelUser, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:channel) }
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_many(:messages) }
  end
end
