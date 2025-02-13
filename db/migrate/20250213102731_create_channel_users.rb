# frozen_string_literal: true

class ChannelUser < ActiveRecord::Migration[8.0]
  def change
    create_table :channel_users do |t|
      t.boolean :active, default: true, null: false
      t.references :channel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
