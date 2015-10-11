require 'open-uri'
class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @title ||= 'Available Options'
    @contracts = Contract.available
  end

  def show
    @user = User.find(params[:id])
    @title ||= "#{@user.fullname}'s Profile"
    if Contract.where(status: 'confirmed').where("buyer_id = ? or seller_id = ?", current_user, current_user).exists?
      Contract.where(status: 'confirmed').where("buyer_id = ? or seller_id = ?", current_user, current_user).each do |c|
#        url = "http://hacknet.blockapps.net/eth/v1.0/storage?address=#{c.address}"
        url = "http://hacknet.blockapps.net/eth/v1.0/storage?address=2ba12e5a3fec3627842fce19682bf981d6773d47"
        @response = JSON.parse(open(url).read)
        if !@response.empty? && (@response.last['value'].to_i == 0)
          c.secured!
        elsif !@response.empty? && c.secured? && (@response.last['value'].to_i == 1)
          c.finalize!
        end
      end
    end
  end
end
