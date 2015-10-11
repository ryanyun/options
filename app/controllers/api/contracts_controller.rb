class Api::ContractsController < ApplicationController
  respond_to :json

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

    respond_to do |format|
      format.json { render json: @contracts }
    end
  end

  api :GET, '/contracts/:id'
  param :id, :number, 'Id (primary key) of contract', required: true
  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.json { render json: @contract }
    end
  end
end
