# frozen_string_literal: true

class CreateMatchMakers < ActiveRecord::Migration[7.0]
  def change
    create_table :match_makers, &:timestamps
  end
end
