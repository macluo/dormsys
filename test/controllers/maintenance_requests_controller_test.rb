require 'test_helper'

class MaintenanceRequestsControllerTest < ActionController::TestCase
  setup do
    @maintenance_request = maintenance_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maintenance_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maintenance_request" do
    assert_difference('MaintenanceRequest.count') do
      post :create, maintenance_request: {  }
    end

    assert_redirected_to maintenance_request_path(assigns(:maintenance_request))
  end

  test "should show maintenance_request" do
    get :show, id: @maintenance_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maintenance_request
    assert_response :success
  end

  test "should update maintenance_request" do
    patch :update, id: @maintenance_request, maintenance_request: {  }
    assert_redirected_to maintenance_request_path(assigns(:maintenance_request))
  end

  test "should destroy maintenance_request" do
    assert_difference('MaintenanceRequest.count', -1) do
      delete :destroy, id: @maintenance_request
    end

    assert_redirected_to maintenance_requests_path
  end
end
