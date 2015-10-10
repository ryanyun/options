class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :redirect_to_users_path_if_signed_in, if: Proc.new {
    user_signed_in? && controller_name == 'home' && action_name == 'index'
  }

  def coinbase_client
    @coinbase_client ||= Coinbase::Wallet::Client.new(
      api_key: ENV['COINBASE_KEY'],
      api_secret: ENV['COINBASE_SECRET'],
      api_url: "https://api.sandbox.coinbase.com"
    )
  end

  private

  def redirect_to_users_path_if_signed_in
    redirect_to users_path
  end
end
