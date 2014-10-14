require 'test_helper'

class FrequenciesControllerTest < ActionController::TestCase
  setup do
    @frequency = frequencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequency" do
    assert_difference('Frequency.count') do
      post :create, frequency: { fri: @frequency.fri, mon: @frequency.mon, route_id: @frequency.route_id, sat: @frequency.sat, sun: @frequency.sun, thur: @frequency.thur, time: @frequency.time, tues: @frequency.tues, wed: @frequency.wed }
    end

    assert_redirected_to frequency_path(assigns(:frequency))
  end

  test "should show frequency" do
    get :show, id: @frequency
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frequency
    assert_response :success
  end

  test "should update frequency" do
    patch :update, id: @frequency, frequency: { fri: @frequency.fri, mon: @frequency.mon, route_id: @frequency.route_id, sat: @frequency.sat, sun: @frequency.sun, thur: @frequency.thur, time: @frequency.time, tues: @frequency.tues, wed: @frequency.wed }
    assert_redirected_to frequency_path(assigns(:frequency))
  end

  test "should destroy frequency" do
    assert_difference('Frequency.count', -1) do
      delete :destroy, id: @frequency
    end

    assert_redirected_to frequencies_path
  end
end
