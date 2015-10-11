class ContractsController < ApplicationController
  layout 'application'
  def index
    @contracts = Contract.available
  end
  
  def new
    @contract = Contract.new
  end
  
  def create
    s = Time.now.to_datetime
    e = new_datetime(contract_params["end_time(1i)"], contract_params["end_time(2i)"], contract_params["end_time(3i)"], contract_params["end_time(4i)"], contract_params["end_time(5i)"])
    @contract = Contract.new(format_params(contract_params, s, e))
    if @contract.save
      flash[:notice] = 'Successfully created contract.'
      redirect_to root_path
    else
      flash[:notice] = 'Error! Contract cannot be saved. Try again.'
      redirect_to new_contract_path
    end
  end
  
  def accept
    @contract = Contract.find(params[:format])
    @contract.accept!
  end
  
  private
  
    def contract_params
      params.require(:contract).permit(:amount, :price, :end_time)
    end
  
    def new_datetime(p1, p2, p3, p4, p5)
      Time.new(p1.to_i, p2.to_i, p3.to_i, p4.to_i, p5.to_i, 0).to_datetime
    end
  
    def format_params(p, s, e)
      {seller_id: current_user.id, amount: p[:amount].to_f, price: p[:price].to_f, start_time: s, end_time: e, status: 'listed'}
    end
end
