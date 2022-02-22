# frozen_string_literal: true

class MatchMaker < ApplicationRecord
  # Removes a player from redis and broadcasts from matchmaker
  def self.withdraw(player)
    $redis.srem('game_set', player.email)
    $redis.del('teams')
    players = $redis.smembers('game_set')
    notify_match_maker(game_data: players, message: 'player left')
    $redis.del 'moves'
    # ActionCable.server.broadcast('matchmaker', { ready: game_ready? })
  end

  # Player joins game after clicking game card
  def self.join_game(player)
    $redis.sadd('game_set', player.email)
    players = $redis.smembers('game_set')
    notify_match_maker(game_data: players, message: 'player join')
    # ActionCable.server.broadcast('matchmaker', { ready: game_ready? })
  end

  # checks if the game has the required number of players, this could be a game specific method?
  def self.game_ready?
    if $redis.scard('game_set') == 2
      make_teams
      true
    else
      false
    end
  end

  # notifies match maker (front) about changes in players number
  def self.notify_match_maker(game_data:, message:)
    ActionCable.server.broadcast('matchmaker',
                                 { game_id: 'game_1',
                                   game_data: game_data,
                                   message: message,
                                   ready: game_ready? })
  end


# This should probably be in another class/service

  def self.make_teams
    teams = $redis.smembers('game_set').group_by {|player| User.find_by_email(player).id.even? ? 'Team 1' : 'Team 2'}
    $redis.sadd('teams', teams)
    set_active_turn
  end

  def self.set_active_turn
    $redis.sadd('teams', { active: $redis.smembers('game_set')[0] })
    active_player = eval($redis.smembers('teams')[1])[:active]
    inactive_player = $redis.smembers('game_set') - [active_player]
    ActionCable.server.broadcast("game_#{active_player}", { active: true })
    ActionCable.server.broadcast("game_#{inactive_player[0]}", { active: false })
  end

  def self.next_turn
    temp = eval($redis.smembers('teams')[1])[:active]
    inactive_player = temp
    active_player = $redis.smembers('game_set') - [inactive_player]
    $redis.srem('teams', { active: inactive_player})
    $redis.sadd('teams', { active: active_player[0]})
    ActionCable.server.broadcast("game_#{active_player[0]}", { active: true })
    ActionCable.server.broadcast("game_#{inactive_player}", { active: false })
  end
end