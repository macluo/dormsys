require 'test_helper'

class TerminationRequestsControllerTest < ActionController::TestCase
  setup do
    @termination_request = termination_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:termination_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create termination_request" do
    assert_difference('TerminationRequest.count') do
      post :create, termination_request: {  }
    end

    assert_redirected_to termination_request_path(assigns(:termination_request))
  end

  test "should show termination_request" do
    get :show, id: @termination_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @termination_request
    assert_response :success
  end

  test "should update termination_request" do
    patch :update, id: @termination_request, termination_request: {  }
    assert_redirected_to termination_request_path(assigns(:termination_request))
  end

  test "should destroy termination_request" do
    assert_difference('TerminationRequest.count', -1) do
      delete :destroy, id: @termination_request
    end

    assert_redirected_to termination_requests_path
  end
end
