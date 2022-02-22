# frozen_string_literal: true

module Gallow
  class HangMan
    attr_accessor :word

    def initialize; end

    def set_word(some: word)
      @word = some
      puts @word
    end

    def do(data)
      $redis.sadd 'moves', { p: data[:player].email, move: data[:player_action] }
      MatchMaker.next_turn
      check_outcome
    end

    private

    def check_outcome
      return if $redis.scard('moves') < 2

      moves = $redis.smembers 'moves'

      if eval(moves[0])[:move].size > eval(moves[1])[:move].size
        ActionCable.server.broadcast('matchmaker', { result: "Player #{eval(moves[0])[:p]} won!" })
      else
        ActionCable.server.broadcast('matchmaker', { result: "Player #{eval(moves[1])[:p]} won!" })
      end
      reset_game
    end

    def reset_game
      $redis.del 'moves'
    end
  end
end
