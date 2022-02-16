class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "game"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def new_tag tag: text
    puts tag
  end

  def test_service
    puts "output test_service"
    Gallow::HangMan.new.set_word some: 'hola'
  end
end
