# frozen_string_literal: true

require 'test_helper'

class StartControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get start_index_url
    assert_response :success
  end
end
