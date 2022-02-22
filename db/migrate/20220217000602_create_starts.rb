# frozen_string_literal: true

class CreateStarts < ActiveRecord::Migration[7.0]
  def change
    create_table :starts, &:timestamps
  end
end
