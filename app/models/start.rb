class Start < ApplicationRecord
  def self.withdraw(player)
    $redis.srem('game_set', player.email)
    players = $redis.smembers('game_set')
    notiy_game(players, 'player left')
    ActionCable.server.broadcast('some_match', { ready: game_ready? })
  end

  def self.join_game(player)
    $redis.sadd('game_set', player.email)
    players = $redis.smembers('game_set')
    notiy_game(players, 'player joined')
  end

  def self.game_ready?
    $redis.scard('game_set') == 2
  end

  def self.notiy_game(players, message)
    ActionCable.server.broadcast('game',
                                 { game_id: 'game_1', game_data: players, message: message })
  end
end
