require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
fixtures :restaurants
include Devise::TestHelpers

  setup do
    sign_in User.first
    @comment = comments(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post :create, comment: { comment: @comment.comment, restaurant_id: @comment.restaurant_id, user_id: @comment.user_id }
    end

    assert_redirected_to restaurants_path
  end

end
