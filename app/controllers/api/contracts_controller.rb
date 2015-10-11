class Api::ContractsController < ApplicationController
  respond_to :json

  before_action :find_contract, only: [:show, :destroy, :update]

  resource_description do
    formats ['json']
    resource_id 'Contracts'
    short 'Returns Contracts Information'
  end

  api :GET, '/contracts'
  param :status,
        ['listed', 'pending', 'accepted', 'confirmed', 'secured'],
        'Status of contract'
  def index
    @contracts = Contract.
                 send(params[:status].present? ? params[:status].to_sym : :all)
    render json: @contracts, status: 200
  end

  api :GET, '/contracts/:id'
  param :id, :number, 'Id (primary key) of contract', required: true
  def show
    render json: @contract, status: 200
  end

  api :POST, '/contracts'
  param :contract, Hash, desc: 'Contract' do
    param :buyer_id, :number, desc: 'Buyer (User) id'
    param :seller_id, :number, desc: 'Seller (User) id'
    param :address, String, 'Contract address'
    param :amount, Float, 'Contract amount in dollars'
    param :price, Float, 'Contract price in dollars'
    param :start_time, DateTime, 'Start time'
    param :end_time, DateTime, 'End time'
    param :buyer_confirmed?, [true, false]
    param :seller_confirmed?, [true, false]
  end
  def create
    @contract = Contract.new(contract_params)

    if @contract.save
      render json: @contract, status: 202
    else
      render json: @contract, status: 422
    end
  end

  api :PUT, '/contracts'
  param :id, :number, desc: 'Id (primary key) of Contract'
  param :contract, Hash, desc: 'Contract' do
    param :buyer_id, :number, desc: 'Buyer (User) id'
    param :seller_id, :number, desc: 'Seller (User) id'
    param :address, String, 'Contract address'
    param :amount, Float, 'Contract amount in dollars'
    param :price, Float, 'Contract price in dollars'
    param :start_time, DateTime, 'Start time'
    param :end_time, DateTime, 'End time'
    param :buyer_confirmed?, [true, false]
    param :seller_confirmed?, [true, false]
  end
  def update
    if @contract.update_attributes(contract_params)
      render json: @contract, status: 202
    else
      render json: @contract, status: 422
    end
  end

  api :DELETE, '/contracts/:id'
  param :id, :number, 'Id (primary key) of contract', required: true
  def destroy
    @contract.destroy
    render json: @controller.to_json, status: 200
  end

  private

  def contract_params
    params.require(:contract).permit(:buyer_id, :seller_id, :address,
      :amount, :price, :start_time, :end_time, :status, :buyer_confirmed?,
      :seller_confirmed?)
  end

  def find_contract
    @contract = Contract.find(params[:id])
  end
end
