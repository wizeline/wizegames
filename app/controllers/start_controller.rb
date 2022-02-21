# frozen_string_literal: true

class StartController < ApplicationController
  def index; end

  def dashboard; end

  def game
    Start.join_game(current_user)
    ActionCable.server.broadcast('some_match', { ready: Start.game_ready? })
  end
end
