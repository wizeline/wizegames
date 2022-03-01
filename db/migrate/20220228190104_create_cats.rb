# frozen_string_literal: true

class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.json :state

      t.timestamps
    end
  end
end
