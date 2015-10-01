require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:chris)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should get show" do
    sign_in @user
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @user
    assert_response :success
  end

  test "should get INDEX" do
    sign_in @user
    get :index
    assert_response :success
  end

  test "shouldn't allow non-signed in ppl" do
    get :index
    assert_redirected_to '/signin'
  end


end
