require 'test_helper'

class PlanificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "default rating and downloads values should be 0" do 
  	plan = Planification.new
  	assert_equal 0, plan.rating, "Rating != 0"
  	assert_equal 0, plan.downloads, "Downloads != 0"
  end
end
