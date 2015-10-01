require 'test_helper'

class ProjectSplitsControllerTest < ActionController::TestCase

  def setup
    @user = users(:chris)
    @project = projects(:workshop)
    @project_split = project_splits(:split1)
  end

  test "should get index" do
    sign_in @user
    get :index, :project_id => @project
    assert_response :success
  end

  test "should get new" do
    sign_in @user
    get :new, :project_id => @project
    assert_response :success
  end

  test "should get show" do
    sign_in @user
    get :show, { :project_id => @project, :id => @project_split }
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, :project_id => @project, :id => @project_split
    assert_response :success
  end

  test "shouldn't allow non-signed in ppl" do
    get :index, :project_id => @project
    assert_redirected_to '/signin'
    get :new, :project_id => @project
    assert_redirected_to '/signin'
  end

  test "should create project_split" do
    sign_in @user
    assert_difference('ProjectSplit.count') do
      post :create, project_id: @project.id, project_split: {user_id: @user.id,
                                    project_id: @project.id,
                                    role: "Sales",
                                    percentage: 22,
                                    anymore: "false" }

    end
    assert_redirected_to project_path(assigns(:project))
    assert_equal 'New Project Split created.', flash[:notice]
  end

  test "should delete project_split" do
    sign_in @user
    assert_difference('ProjectSplit.count', -1) do
      delete :destroy, project_id: @project.id, id: @project_split
    end
    assert_redirected_to project_path(@project)
    assert_not flash.empty?
  end

  test "should update project_split" do
    sign_in @user
    patch :update, project_id: @project.id, id: @project_split.id, project_split: {
                                    user_id: @user.id,
                                    project_id: @project.id,
                                    role: "Coordinator" }
    assert_redirected_to project_path(@project)
    assert_not flash.empty?
  end

end
