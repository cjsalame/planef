require 'test_helper'

class PlanificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @planification = planifications(:one)
  end

  test "should get index" do
    get planifications_url
    assert_response :success
  end

  test "should get new" do
    get new_planification_url
    assert_response :success
  end

  test "should create planification" do
    assert_difference('Planification.count') do
      post planifications_url, params: { planification: { date: @planification.date, downloads: @planification.downloads, name: @planification.name, rating: @planification.rating } }
    end

    assert_redirected_to planification_url(Planification.last)
  end

  test "should show planification" do
    get planification_url(@planification)
    assert_response :success
  end

  test "should get edit" do
    get edit_planification_url(@planification)
    assert_response :success
  end

  test "should update planification" do
    patch planification_url(@planification), params: { planification: { date: @planification.date, downloads: @planification.downloads, name: @planification.name, rating: @planification.rating } }
    assert_redirected_to planification_url(@planification)
  end

  test "should destroy planification" do
    assert_difference('Planification.count', -1) do
      delete planification_url(@planification)
    end

    assert_redirected_to planifications_url
  end
end
