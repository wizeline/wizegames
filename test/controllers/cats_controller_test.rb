require "test_helper"

class CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cats_index_url
    assert_response :success
  end

  test "should get show" do
    get cats_show_url
    assert_response :success
  end

  test "should get create" do
    get cats_create_url
    assert_response :success
  end

  test "should get _cat" do
    get cats__cat_url
    assert_response :success
  end
end
