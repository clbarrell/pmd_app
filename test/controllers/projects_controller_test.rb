require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase

  def setup
    @user = users(:chris)
    @project = projects(:workshop)
    @client = clients(:abs)
    @contact = contacts(:john)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should get show" do
    sign_in @user
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @project
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

  test "should create project" do
    sign_in @user
    assert_difference('Project.count') do
      # Needs full details of project
      post :create, project: {name: 'Wellbeing Workshop 2',
                              total: 12333.50,
                              probability: 50,
                              service_line: 'Leadership',
                              status: 'Active',
                              project_type: 'Proposal',
                              suitable_reference: false,
                              client_id: @client.id,
                              contact_id: @contact.id }
    end
    assert_redirected_to new_project_project_split_path(assigns(:project))
    assert_equal 'New project created: Wellbeing Workshop 2.', flash[:notice]
  end

  test "should delete project" do
    sign_in @user
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
      # What about checking the difference with project_splits?
    end
    assert_redirected_to projects_path
    assert_not flash.empty?
  end

  test "should update project" do
    sign_in @user
    patch :update, id: @project.id, project: { name: "new project name" }
    assert_redirected_to project_path(assigns(:project))
    assert_not flash.empty?
  end

end
