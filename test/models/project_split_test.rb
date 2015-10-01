require 'test_helper'

class ProjectSplitTest < ActiveSupport::TestCase

  def setup
    @psplit = project_splits(:split1)
  end

  test "should be valid" do
    assert @psplit.valid?
  end

 #   user: chris
  #project: workshop
  #role: sales
  #percentage: 80.0

  test "needs a user" do
    @psplit.user = nil
    assert_not @psplit.valid? "No user attached"
  end

  test "needs a project" do
    @psplit.project = nil
    assert_not @psplit.valid? "no project attached"
  end

  test "needs a role" do
    @psplit.role = nil
    assert_not @psplit.valid?
    @psplit.role = "bobb"
    assert_not @psplit.valid?
    @psplit.role = "Sales"
    @psplit.percentage = 80
    assert @psplit.valid?
  end

  test "needs a percentage depending on...." do
    #Test the sales role first
    @psplit.role = "Sales"
    @psplit.percentage = "test"
    assert_not @psplit.valid?
    assert_equal ["is not a number"], @psplit.errors.messages[:percentage]
    @psplit.percentage = 80
    assert @psplit.valid?
    # Test the other 2 roles that allow empty percentage
    @psplit.role = "Involved"
    @psplit.percentage = nil
    assert @psplit.valid?

    #test wrong number
    @psplit.role = "Sales"
    @psplit.percentage = 120
    assert_not   @psplit.valid?
  end

  test "split money amount" do
    testnum = ((@psplit.percentage / 100) * @psplit.project.total).to_s(:currency)
    assert_equal( testnum, @psplit.split_amount )
    assert_not_empty( @psplit.split_amount )
  end

end
