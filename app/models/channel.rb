# frozen_string_literal: true

class Channel < ApplicationRecord
  has_many :channel_users
  has_many :users, through: :channel_users
  has_many :messages, through: :channel_users

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
