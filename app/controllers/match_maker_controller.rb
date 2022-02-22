# frozen_string_literal: true

class MatchMakerController < ApplicationController
  # When joining a game
  def game
    MatchMaker.join_game(current_user)
    ActionCable.server.broadcast("game_#{current_user.email}", { status: 'setup' })
  end
end
