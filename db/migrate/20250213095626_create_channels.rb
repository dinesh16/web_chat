# frozen_string_literal: true

class CreateChannels < ActiveRecord::Migration[8.0]
  def change
    create_table :channels do |t|
      t.string :name, index: { unique: true }, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
