class FourLine < ApplicationRecord
  belongs_to :user
  broadcasts

  before_validation on: :create do
    self.state = {
      current_symbol: ['x', 'o'].sample,
      winner_state: false,
      board: {
        0 => { 0 => nil, 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil },
        1 => { 0 => nil, 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil },
        2 => { 0 => nil, 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil },
        3 => { 0 => nil, 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil },
        4 => { 0 => nil, 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil },
        5 => { 0 => nil, 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil },
        6 => { 0 => nil, 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil }
      }
    }
  end

  def move row, col
    self.state['board'][row.to_s][col.to_s] = self.state['current_symbol']
    self.state['current_symbol'] = self.state['current_symbol'] == 'x' ? 'o' : 'x'
    self.save!
  end
end