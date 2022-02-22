# frozen_string_literal: true

class MatchMakerChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'matchmaker'
  end

  def unsubscribed
    MatchMaker.withdraw(current_user)
  end
end
