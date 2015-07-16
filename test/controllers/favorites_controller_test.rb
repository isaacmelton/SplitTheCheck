require 'test_helper'

class FavoritesControllerTest < ActionController::TestCase
fixtures :restaurants
include Devise::TestHelpers


  setup do
    sign_in User.first
    @favorite = favorites(:one)
  end

  test "should create favorite" do
    assert_difference('Favorite.count') do
      post :create, favorite: { restaurant_id: @favorite.restaurant_id, user_id: @favorite.user_id, vote: @favorite.vote }
    end

    assert_redirected_to restaurants_path
  end
end
