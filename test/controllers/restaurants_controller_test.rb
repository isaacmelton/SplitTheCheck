require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
fixtures :restaurants
include Devise::TestHelpers

  setup do
    sign_in User.first
    @restaurant = restaurants(:bones)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { address: @restaurant.address, city: @restaurant.city, name: @restaurant.name, state: @restaurant.state, zip: @restaurant.zip }
    end

    assert_redirected_to restaurants_path
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

end
