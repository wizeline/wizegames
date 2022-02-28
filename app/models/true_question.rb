class TrueQuestion < ApplicationRecord
  belongs_to :user
  broadcasts

  before_validation on: :create do
    self.questions = {
      user_id: nil,
      0 => { sentence: nil, status: nil }, # => Won a Tae Kwon Do contest.
      1 => { sentence: nil, status: nil }, # => Played in an 80\'s band.
      2 => { sentence: nil, status: nil } # => Acted in a film.
    }
  end
end
