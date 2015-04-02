require 'test_helper'

class ParkingRequestsControllerTest < ActionController::TestCase
  setup do
    @parking_request = parking_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parking_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parking_request" do
    assert_difference('ParkingRequest.count') do
      post :create, parking_request: {  }
    end

    assert_redirected_to parking_request_path(assigns(:parking_request))
  end

  test "should show parking_request" do
    get :show, id: @parking_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parking_request
    assert_response :success
  end

  test "should update parking_request" do
    patch :update, id: @parking_request, parking_request: {  }
    assert_redirected_to parking_request_path(assigns(:parking_request))
  end

  test "should destroy parking_request" do
    assert_difference('ParkingRequest.count', -1) do
      delete :destroy, id: @parking_request
    end

    assert_redirected_to parking_requests_path
  end
end
