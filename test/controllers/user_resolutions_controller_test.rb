require "test_helper"

class UserResolutionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_resolution = user_resolutions(:one)
  end

  test "should get index" do
    get user_resolutions_url
    assert_response :success
  end

  test "should get new" do
    get new_user_resolution_url
    assert_response :success
  end

  test "should create user_resolution" do
    assert_difference("UserResolution.count") do
      post user_resolutions_url, params: { user_resolution: { resolution_id: @user_resolution.resolution_id, user_id: @user_resolution.user_id } }
    end

    assert_redirected_to user_resolution_url(UserResolution.last)
  end

  test "should show user_resolution" do
    get user_resolution_url(@user_resolution)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_resolution_url(@user_resolution)
    assert_response :success
  end

  test "should update user_resolution" do
    patch user_resolution_url(@user_resolution), params: { user_resolution: { resolution_id: @user_resolution.resolution_id, user_id: @user_resolution.user_id } }
    assert_redirected_to user_resolution_url(@user_resolution)
  end

  test "should destroy user_resolution" do
    assert_difference("UserResolution.count", -1) do
      delete user_resolution_url(@user_resolution)
    end

    assert_redirected_to user_resolutions_url
  end
end
