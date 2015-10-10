class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def coinbase_client
    @coinbase_client ||= Coinbase::Wallet::Client.new(
      api_key: ENV['COINBASE_KEY'],
      api_secret: ENV['COINBASE_SECRET'],
      api_url: "https://api.sandbox.coinbase.com"
    )
  end
end
