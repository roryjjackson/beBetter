require "application_system_test_case"

class HelpersTest < ApplicationSystemTestCase
  setup do
    @helper = helpers(:one)
  end

  test "visiting the index" do
    visit helpers_url
    assert_selector "h1", text: "Helpers"
  end

  test "should create helper" do
    visit helpers_url
    click_on "New helper"

    fill_in "Occupation", with: @helper.occupation
    fill_in "Summary", with: @helper.summary
    fill_in "User", with: @helper.user_id
    click_on "Create Helper"

    assert_text "Helper was successfully created"
    click_on "Back"
  end

  test "should update Helper" do
    visit helper_url(@helper)
    click_on "Edit this helper", match: :first

    fill_in "Occupation", with: @helper.occupation
    fill_in "Summary", with: @helper.summary
    fill_in "User", with: @helper.user_id
    click_on "Update Helper"

    assert_text "Helper was successfully updated"
    click_on "Back"
  end

  test "should destroy Helper" do
    visit helper_url(@helper)
    click_on "Destroy this helper", match: :first

    assert_text "Helper was successfully destroyed"
  end
end
