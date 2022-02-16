module ApplicationCable
  class Connection < ActionCable::Connection::Base
    def connect
      p 'hola aqui estoy'
    end
  end
end
