require 'test_helper'

class ReservsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get reservs_create_url
    assert_response :success
  end

  test "should get update" do
    get reservs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get reservs_destroy_url
    assert_response :success
  end

end
