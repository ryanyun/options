require 'test_helper'

class Api::ContractsControllerTest < ActionController::TestCase
  def setup
    [:contract_one, :contract_two].each { |contract| contracts(contract) }
  end

  test 'GET index' do
    get :index, format: :json
    assert_response :success
    assert_equal assigns(:contracts).count, 2
  end

  test 'GET show' do
    contract = Contract.first
    get :show, id: contract.id, format: :json
    assert_response :success
    assert_equal assigns(:contract), contract
  end
end
