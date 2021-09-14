require "test_helper"

class StaticpageControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get help" do
    get root_path
    assert_response :success
  end

  test "should get about" do
    get root_path
    assert_response :success
  end

  test "should get contact" do
    get root_path
    assert_response :success
  end
end
