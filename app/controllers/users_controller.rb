class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @title ||= 'Welcome. What would you like to do today?'
  end
end
