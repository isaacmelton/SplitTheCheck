require 'test_helper'

class VotesControllerTest < ActionController::TestCase
include Devise::TestHelpers

  setup do
    sign_in User.first
    @vote = votes(:one)
  end

  test "should create vote" do
    sign_in User.first
    assert_difference('Vote.count') do
      post :create, vote: { email: @vote.email, restaurantID: @vote.restaurantID, split: @vote.split }
  end

    assert_redirected_to root_path
  end

end
