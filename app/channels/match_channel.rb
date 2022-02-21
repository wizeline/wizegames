class MatchChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'some_match'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def notify(params)
    p params['data']
    Game.do_actions data: { player: current_user, player_action: params['data'] }, ref: Gallow::HangMan.new
  end
end
