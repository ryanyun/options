class BidsController < ApplicationController
  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      flash[:notice] = 'Successfully placed bid.'
      redirect_to root_path
    else
      flash[:notice] = 'Error! Contract cannot be saved. Try again.'
      redirect_to new_bid_path
    end
  end
  
  private
  
    def bid_params
      params.require(:bid).permit(:bidder_id, :contract_id)
    end
end
