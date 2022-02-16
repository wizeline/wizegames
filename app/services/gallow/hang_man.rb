module Gallow
  class HangMan
    attr_accessor :word
    def initialize; end

    def set_word some: word
      @word = some
      puts @word
    end
  end
end
