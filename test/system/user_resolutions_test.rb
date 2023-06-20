require "application_system_test_case"

class UserResolutionsTest < ApplicationSystemTestCase
  setup do
    @user_resolution = user_resolutions(:one)
  end

  test "visiting the index" do
    visit user_resolutions_url
    assert_selector "h1", text: "User resolutions"
  end

  test "should create user resolution" do
    visit user_resolutions_url
    click_on "New user resolution"

    fill_in "Resolution", with: @user_resolution.resolution_id
    fill_in "User", with: @user_resolution.user_id
    click_on "Create User resolution"

    assert_text "User resolution was successfully created"
    click_on "Back"
  end

  test "should update User resolution" do
    visit user_resolution_url(@user_resolution)
    click_on "Edit this user resolution", match: :first

    fill_in "Resolution", with: @user_resolution.resolution_id
    fill_in "User", with: @user_resolution.user_id
    click_on "Update User resolution"

    assert_text "User resolution was successfully updated"
    click_on "Back"
  end

  test "should destroy User resolution" do
    visit user_resolution_url(@user_resolution)
    click_on "Destroy this user resolution", match: :first

    assert_text "User resolution was successfully destroyed"
  end
end
