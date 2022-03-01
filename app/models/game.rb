# frozen_string_literal: true

class Game < ApplicationRecord
  before_validation on: :create do
  end

  broadcasts

  def register_user(user)
    @users = players.nil? ? {} : players
    @users.store(user.id, user.email) unless @users.key?(user.id) == true
    self.players = @users
    save!
  end

  def set_game(name: nil, sort: nil, id: nil)
    self.data = { name:, sort:, game_id: id }
    save!
  end
end
