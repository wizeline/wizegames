# frozen_string_literal: true

class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.json :data
      t.json :players
      t.json :state
      t.json :result
      t.json :statistics

      t.timestamps
    end
  end
end
