# frozen_string_literal: true

class CreateTrueQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :true_questions do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.json :questions

      t.timestamps
    end
  end
end
