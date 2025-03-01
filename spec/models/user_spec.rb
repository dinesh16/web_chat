# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:channel_users) }
    it { is_expected.to have_many(:channels).through(:channel_users) }
  end
end
