class HangmenController < ApplicationController
  def index
    @hangmen = Hangman.all
  end

  def show
    @hangman = Hangman.find params[:id]
  end

  def create
    redirect_to Hangman.create
  end
end
