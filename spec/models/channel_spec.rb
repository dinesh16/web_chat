# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Channel, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:channel_users) }
    it { is_expected.to have_many(:users).through(:channel_users) }
    it { is_expected.to have_many(:messages).through(:channel_users) }
  end

  describe 'validations' do
    subject(:channel) { build(:channel) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  end
end
