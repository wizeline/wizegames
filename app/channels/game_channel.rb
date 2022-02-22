# frozen_string_literal: true

class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game_#{current_user.email}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def notify(params)
    Game.do_actions(
      data: { player: current_user, player_action: params['data'] },
      ref: Gallow::HangMan.new
    )
  end
end
