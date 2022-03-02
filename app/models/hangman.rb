require 'spicy-proton'

class Hangman < ApplicationRecord
  belongs_to :user
  broadcasts

  before_validation on: :create do
    self.state = {
      chances: 6,
      word: Spicy::Proton.adjective,
      placeholder: '*' * 'secret'.size,
      game_state: 'Running'
      }
  end

  def move(guess)
    return if state['game_state'] != 'Running'

    run guess
    check_victory_condition
    save!
  end

  def run(guess)
    state['chances'] -= missess(check(guess))
    correct_guesses = check(guess).flatten
    replace_guesses(correct_guesses)
  end

  def check(guess)
    guess.each_char.map do |c|
      state['word'].split('').each_index.select do |i|
        state['word'].split('')[i] == c
      end
    end
  end

  def replace_guesses(guesses)
    state['placeholder'] =
      state['placeholder'].split('').map.with_index do |_v, i|
        guesses.include?(i) ? state['word'].split('')[i] : state['placeholder'][i]
      end.join
  end

  def missess(groups)
    groups.count { |group| group.size.zero? }
  end

  def check_victory_condition
    if state['chances'] <= 0
      state['game_state'] = 'GameOver'
      save!
    end

    if state['placeholder'] == state['word']
      state['game_state'] = 'Victory'
      save!
    end
  end
end
