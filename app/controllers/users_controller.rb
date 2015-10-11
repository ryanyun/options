class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @title ||= 'Welcome. What would you like to do today?'
  end

  def show
    @user = User.find(params[:id])
    @title ||= @user.fullname
  end
end
