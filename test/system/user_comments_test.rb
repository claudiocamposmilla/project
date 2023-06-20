require "application_system_test_case"

class UserCommentsTest < ApplicationSystemTestCase
  setup do
    @user_comment = user_comments(:one)
  end

  test "visiting the index" do
    visit user_comments_url
    assert_selector "h1", text: "User comments"
  end

  test "should create user comment" do
    visit user_comments_url
    click_on "New user comment"

    fill_in "Body", with: @user_comment.body
    fill_in "Ticket", with: @user_comment.ticket_id
    fill_in "User", with: @user_comment.user_id
    click_on "Create User comment"

    assert_text "User comment was successfully created"
    click_on "Back"
  end

  test "should update User comment" do
    visit user_comment_url(@user_comment)
    click_on "Edit this user comment", match: :first

    fill_in "Body", with: @user_comment.body
    fill_in "Ticket", with: @user_comment.ticket_id
    fill_in "User", with: @user_comment.user_id
    click_on "Update User comment"

    assert_text "User comment was successfully updated"
    click_on "Back"
  end

  test "should destroy User comment" do
    visit user_comment_url(@user_comment)
    click_on "Destroy this user comment", match: :first

    assert_text "User comment was successfully destroyed"
  end
end
