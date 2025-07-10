require "application_system_test_case"

class OffboardingsTest < ApplicationSystemTestCase
  setup do
    @offboarding = offboardings(:one)
  end

  test "visiting the index" do
    visit offboardings_url
    assert_selector "h1", text: "Offboardings"
  end

  test "should create offboarding" do
    visit offboardings_url
    click_on "New offboarding"

    fill_in "Created by", with: @offboarding.created_by_id
    fill_in "Due date", with: @offboarding.due_date
    fill_in "Employee", with: @offboarding.employee_id
    fill_in "Status", with: @offboarding.status
    click_on "Create Offboarding"

    assert_text "Offboarding was successfully created"
    click_on "Back"
  end

  test "should update Offboarding" do
    visit offboarding_url(@offboarding)
    click_on "Edit this offboarding", match: :first

    fill_in "Created by", with: @offboarding.created_by_id
    fill_in "Due date", with: @offboarding.due_date
    fill_in "Employee", with: @offboarding.employee_id
    fill_in "Status", with: @offboarding.status
    click_on "Update Offboarding"

    assert_text "Offboarding was successfully updated"
    click_on "Back"
  end

  test "should destroy Offboarding" do
    visit offboarding_url(@offboarding)
    click_on "Destroy this offboarding", match: :first

    assert_text "Offboarding was successfully destroyed"
  end
end
