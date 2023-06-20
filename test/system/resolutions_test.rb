require "application_system_test_case"

class ResolutionsTest < ApplicationSystemTestCase
  setup do
    @resolution = resolutions(:one)
  end

  test "visiting the index" do
    visit resolutions_url
    assert_selector "h1", text: "Resolutions"
  end

  test "should create resolution" do
    visit resolutions_url
    click_on "New resolution"

    fill_in "Evaluation", with: @resolution.evaluation
    fill_in "Resolution comment", with: @resolution.resolution_comment
    fill_in "Resolved", with: @resolution.resolved
    fill_in "Ticket", with: @resolution.ticket_id
    click_on "Create Resolution"

    assert_text "Resolution was successfully created"
    click_on "Back"
  end

  test "should update Resolution" do
    visit resolution_url(@resolution)
    click_on "Edit this resolution", match: :first

    fill_in "Evaluation", with: @resolution.evaluation
    fill_in "Resolution comment", with: @resolution.resolution_comment
    fill_in "Resolved", with: @resolution.resolved
    fill_in "Ticket", with: @resolution.ticket_id
    click_on "Update Resolution"

    assert_text "Resolution was successfully updated"
    click_on "Back"
  end

  test "should destroy Resolution" do
    visit resolution_url(@resolution)
    click_on "Destroy this resolution", match: :first

    assert_text "Resolution was successfully destroyed"
  end
end
