require 'test_helper'

class ClientsControllerTest < ActionController::TestCase

  def setup
    @user = users(:chris)
    @client = clients(:abs)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should get show" do
    sign_in @user
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @client
    assert_response :success
  end

  test "should get index" do
    sign_in @user
    get :index
    assert_response :success
  end

  test "shouldn't allow non-signed in ppl" do
    get :index
    assert_redirected_to '/signin'
    get :new
    assert_redirected_to '/signin'
  end

  test "should create client" do
    sign_in @user
    assert_difference('Client.count') do
      post :create, client: {name: 'Name of contact'}
    end
    assert_redirected_to client_path(assigns(:client))
    assert_equal 'New client created.', flash[:notice]
  end

  test "should delete client" do
    sign_in @user
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end
    assert_redirected_to clients_path
    assert_not flash.empty?
  end

  test "should update client" do
    sign_in @user
    @client.name = "HEllo"
    patch :update, id: @client.id, client: { name: @client.name }
    assert_redirected_to client_path(assigns(:client))
    assert_not flash.empty?
  end


end
