require "test_helper"

class OffboardingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @offboarding = offboardings(:one)
  end

  test "should get index" do
    get offboardings_url
    assert_response :success
  end

  test "should get new" do
    get new_offboarding_url
    assert_response :success
  end

  test "should create offboarding" do
    assert_difference("Offboarding.count") do
      post offboardings_url, params: { offboarding: { created_by_id: @offboarding.created_by_id, due_date: @offboarding.due_date, employee_id: @offboarding.employee_id, status: @offboarding.status } }
    end

    assert_redirected_to offboarding_url(Offboarding.last)
  end

  test "should show offboarding" do
    get offboarding_url(@offboarding)
    assert_response :success
  end

  test "should get edit" do
    get edit_offboarding_url(@offboarding)
    assert_response :success
  end

  test "should update offboarding" do
    patch offboarding_url(@offboarding), params: { offboarding: { created_by_id: @offboarding.created_by_id, due_date: @offboarding.due_date, employee_id: @offboarding.employee_id, status: @offboarding.status } }
    assert_redirected_to offboarding_url(@offboarding)
  end

  test "should destroy offboarding" do
    assert_difference("Offboarding.count", -1) do
      delete offboarding_url(@offboarding)
    end

    assert_redirected_to offboardings_url
  end
end
