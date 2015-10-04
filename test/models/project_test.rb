require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = projects(:workshop)
  end

  test "ensure is valid" do
    assert @project.valid?
  end

  test "ensure name is valid" do
    @project.name = ""
    assert_not @project.valid?
  end

  test "ensure job_number is valid" do
    @project.job_number = nil
    assert_not @project.valid?
    @project.job_number = "test"
    assert_not @project.valid?
  end

  test "ensure total is valid" do
    @project.total = nil
    assert_not @project.valid?
    @project.total = "test"
    assert_not @project.valid?
  end

  test "ensure probability is valid" do
    @project.probability = nil
    assert_not @project.valid?
    @project.probability = "test"
    assert_not @project.valid?
    @project.probability = 99
    assert @project.valid?, "Probability takes 99?"
  end

  test "ensure service_line is valid" do
    @project.service_line = nil
    assert_not @project.valid?
    @project.service_line = "test"
    assert_not @project.valid?
    #hard coding a service line...?
    @project.service_line = "Leadership"
    assert @project.valid?, "Is leadership in project_type list?"
  end

  test "project type is proper" do
    @project.project_type = nil
    assert_not @project.valid?
    @project.project_type = "test"
    assert_not @project.valid?
    # Hard coding project types
    @project.project_type = "Proposal"
    assert @project.valid?
  end

  test "Suitable reference should be present" do
    @project.suitable_reference = nil
    assert_not @project.valid?
    @project.suitable_reference = false
    assert @project.valid?, "Doesn't allow for boolean referencE?"
  end

  test "should link to client" do
    @project.client = nil
    assert_not @project.valid?
  end

  test "should link to contact" do
    @project.contact = nil
    assert_not @project.valid?
  end

  test "is status valid?" do
    @project.status = nil
    assert_not @project.valid?
    @project.status = "Complete"
    assert @project.valid?
  end
  
  test "coordinator function working" do
    assert_equal @project.coordinators, "Cara Davoli"
  end

end
