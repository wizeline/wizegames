class Game < ApplicationRecord
  broadcasts

  def register_user user
    @users = self.players.nil? ? Hash.new : self.players
    @users.store(user.id, user.email) unless @users.has_key?(user.id) == true
    self.players = @users
    self.save!
  end

  def set_game name: nil, sort: nil, id: nil
    self.data = { name: name, sort: sort, game_id: id }
    self.save!
  end
end
