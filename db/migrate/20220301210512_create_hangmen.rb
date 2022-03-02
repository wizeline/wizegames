class CreateHangmen < ActiveRecord::Migration[7.0]
  def change
    create_table :hangmen do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.json :state

      t.timestamps
    end
  end
end
