require "test_helper"

class Public::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get public_items_top_url
    assert_response :success
  end

  test "should get about" do
    get public_items_about_url
    assert_response :success
  end
end
