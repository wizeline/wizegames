require "test_helper"

class FourLinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get four_lines_index_url
    assert_response :success
  end

  test "should get show" do
    get four_lines_show_url
    assert_response :success
  end

  test "should get create" do
    get four_lines_create_url
    assert_response :success
  end

  test "should get _four_line" do
    get four_lines__four_line_url
    assert_response :success
  end
end
