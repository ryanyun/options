require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'GET index when not signed in' do
    get :index
    assert_response :redirect
  end

  test 'GET index when signed in' do
    chris = users(:chris)
    sign_in chris
    get :index
    assert_response :success
  end

  test 'GET show' do
    chris = users(:chris)
    sign_in chris
    get :show, id: chris.id
    assert_response :success
    assert_equal chris, assigns(:user)
  end
end
