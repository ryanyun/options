require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test 'GET index when not signed in' do
    get :index
    assert_response :success
  end

  test 'GET index when signed in' do
    chris = users(:chris)
    sign_in chris
    get :index
    assert_response :redirect
  end
end
