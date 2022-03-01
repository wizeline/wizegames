# frozen_string_literal: true

require 'application_system_test_case'

class GamesTest < ApplicationSystemTestCase
  setup do
    @game = games(:one)
  end

  test 'visiting the index' do
    visit games_url
    assert_selector 'h1', text: 'Games'
  end

  test 'should create game' do
    visit games_url
    click_on 'New game'

    fill_in 'Data', with: @game.data
    fill_in 'Players', with: @game.players
    fill_in 'Result', with: @game.result
    fill_in 'State', with: @game.state
    fill_in 'Statistics', with: @game.statistics
    click_on 'Create Game'

    assert_text 'Game was successfully created'
    click_on 'Back'
  end

  test 'should update Game' do
    visit game_url(@game)
    click_on 'Edit this game', match: :first

    fill_in 'Data', with: @game.data
    fill_in 'Players', with: @game.players
    fill_in 'Result', with: @game.result
    fill_in 'State', with: @game.state
    fill_in 'Statistics', with: @game.statistics
    click_on 'Update Game'

    assert_text 'Game was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Game' do
    visit game_url(@game)
    click_on 'Destroy this game', match: :first

    assert_text 'Game was successfully destroyed'
  end
end
