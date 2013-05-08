require 'test_helper'

class ReceipientsControllerTest < ActionController::TestCase
  setup do
    @receipient = receipients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receipients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receipient" do
    assert_difference('Receipient.count') do
      post :create, receipient: { email: @receipient.email, name: @receipient.name }
    end

    assert_redirected_to receipient_path(assigns(:receipient))
  end

  test "should show receipient" do
    get :show, id: @receipient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @receipient
    assert_response :success
  end

  test "should update receipient" do
    put :update, id: @receipient, receipient: { email: @receipient.email, name: @receipient.name }
    assert_redirected_to receipient_path(assigns(:receipient))
  end

  test "should destroy receipient" do
    assert_difference('Receipient.count', -1) do
      delete :destroy, id: @receipient
    end

    assert_redirected_to receipients_path
  end
end
