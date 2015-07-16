require 'test_helper'

class SummariesControllerTest < ActionController::TestCase
include Devise::TestHelpers


  setup do
    sign_in User.first
    @summary = summaries(:one)
  end

  test "should create summary" do
    assert_difference('Summary.count') do
      post :create, summary: { restaurant_id: @summary.restaurant_id, user_id: @summary.user_id }
    end

    assert_redirected_to restaurants_path
  end

  test "should show summary" do
    get :show, id: @summary
    assert_response :success
  end
end
