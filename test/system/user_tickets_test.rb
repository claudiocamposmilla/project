require "application_system_test_case"

class UserTicketsTest < ApplicationSystemTestCase
  setup do
    @user_ticket = user_tickets(:one)
  end

  test "visiting the index" do
    visit user_tickets_url
    assert_selector "h1", text: "User tickets"
  end

  test "should create user ticket" do
    visit user_tickets_url
    click_on "New user ticket"

    fill_in "Ticket", with: @user_ticket.ticket_id
    fill_in "User", with: @user_ticket.user_id
    click_on "Create User ticket"

    assert_text "User ticket was successfully created"
    click_on "Back"
  end

  test "should update User ticket" do
    visit user_ticket_url(@user_ticket)
    click_on "Edit this user ticket", match: :first

    fill_in "Ticket", with: @user_ticket.ticket_id
    fill_in "User", with: @user_ticket.user_id
    click_on "Update User ticket"

    assert_text "User ticket was successfully updated"
    click_on "Back"
  end

  test "should destroy User ticket" do
    visit user_ticket_url(@user_ticket)
    click_on "Destroy this user ticket", match: :first

    assert_text "User ticket was successfully destroyed"
  end
end
