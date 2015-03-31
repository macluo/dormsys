require 'test_helper'

class HousingRequestsControllerTest < ActionController::TestCase
  setup do
    @housing_request = housing_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:housing_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create housing_request" do
    assert_difference('HousingRequest.count') do
      post :create, housing_request: {  }
    end

    assert_redirected_to housing_request_path(assigns(:housing_request))
  end

  test "should show housing_request" do
    get :show, id: @housing_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @housing_request
    assert_response :success
  end

  test "should update housing_request" do
    patch :update, id: @housing_request, housing_request: {  }
    assert_redirected_to housing_request_path(assigns(:housing_request))
  end

  test "should destroy housing_request" do
    assert_difference('HousingRequest.count', -1) do
      delete :destroy, id: @housing_request
    end

    assert_redirected_to housing_requests_path
  end
end
