require "test_helper"

class Admin::TestsControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get admin_tests_about_url
    assert_response :success
  end
end
