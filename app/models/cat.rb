class Cat < ApplicationRecord
  belongs_to :user
  broadcasts

  before_validation on: :create do
    self.state = {
      winner_state: false,
      0 => { 0 => nil, 1 => nil, 2 => nil },
      1 => { 0 => nil, 1 => nil, 2 => nil },
      2 => { 0 => nil, 1 => nil, 2 => nil }
    }
    # state[row][col]

    #@current_symbol = [:x, :o].sample
  end

  # def move! row, col
  #   state[row.to_s][col.to_s] = @current_symbol
  #   self.current_symbol = @current_symbol == 'x' ? 'o' : 'x'
  #   self.save!
  # end
end
