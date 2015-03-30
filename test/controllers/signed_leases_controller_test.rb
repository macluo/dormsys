require 'test_helper'

class SignedLeasesControllerTest < ActionController::TestCase
  setup do
    @signed_lease = signed_leases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signed_leases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signed_lease" do
    assert_difference('SignedLease.count') do
      post :create, signed_lease: {  }
    end

    assert_redirected_to signed_lease_path(assigns(:signed_lease))
  end

  test "should show signed_lease" do
    get :show, id: @signed_lease
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @signed_lease
    assert_response :success
  end

  test "should update signed_lease" do
    patch :update, id: @signed_lease, signed_lease: {  }
    assert_redirected_to signed_lease_path(assigns(:signed_lease))
  end

  test "should destroy signed_lease" do
    assert_difference('SignedLease.count', -1) do
      delete :destroy, id: @signed_lease
    end

    assert_redirected_to signed_leases_path
  end
end
