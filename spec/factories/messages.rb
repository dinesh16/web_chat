# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    channel_user
    content { Faker::Lorem.sentence }
  end
end
