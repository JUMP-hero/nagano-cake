require "test_helper"

class Admin::Genres2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_genres2_index_url
    assert_response :success
  end
end
