class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @title ||= 'Available Options'
    @contracts = Contract.available
  end

  def show
    @user = User.find(params[:id])
    @title ||= "#{@user.fullname}'s Profile"
  end
end
