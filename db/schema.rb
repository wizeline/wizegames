# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_220_301_165_754) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cats', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.json 'state'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_cats_on_user_id'
  end

  create_table 'four_lines', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.json 'state'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_four_lines_on_user_id'
  end

  create_table 'games', force: :cascade do |t|
    t.json 'data'
    t.json 'players'
    t.json 'state'
    t.json 'result'
    t.json 'statistics'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'games_moves', id: false, force: :cascade do |t|
    t.bigint 'game_id', null: false
    t.bigint 'move_id', null: false
    t.index %w[game_id move_id], name: 'index_games_moves_on_game_id_and_move_id'
  end

  create_table 'hangmen', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.json 'state'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_hangmen_on_user_id'
  end

  create_table 'moves', force: :cascade do |t|
    t.json 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sessions', force: :cascade do |t|
    t.string 'session_id', null: false
    t.text 'data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['session_id'], name: 'index_sessions_on_session_id', unique: true
    t.index ['updated_at'], name: 'index_sessions_on_updated_at'
  end

  create_table 'true_questions', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.json 'questions'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_true_questions_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider'
    t.string 'uid'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['provider'], name: 'index_users_on_provider'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['uid'], name: 'index_users_on_uid'
  end

  add_foreign_key 'cats', 'users'
  add_foreign_key 'four_lines', 'users'
  add_foreign_key 'hangmen', 'users'
  add_foreign_key 'true_questions', 'users'
end
