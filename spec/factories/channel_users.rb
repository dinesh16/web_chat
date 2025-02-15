# frozen_string_literal: true

FactoryBot.define do
  factory :channel_user do
    channel { create(:channel) }
    user { create(:user) }
  end
end
