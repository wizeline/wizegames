class Game < ApplicationRecord
  def self.do_actions(data:, ref:)
    ref.do data
  end
end
