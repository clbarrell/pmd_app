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

  test "should delete user" do
    sign_in @user
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end
    assert_redirected_to users_path
    assert_not flash.empty?
  end

  test "should update user" do
    sign_in @user
    @user.name = "HEllo"
    patch :update, id: @user.id, user: { name: "zfgdf Barrell",
                                email: "cbarrell@sdfjk.com",
                                initials: "CBL",
                                admin: false }
    assert_redirected_to user_path(@user)
    assert_not flash.empty?
  end


end
