Rails.application.config.middleware.use OmniAuth::Builder do
  provider :coinbase,
           ENV['COINBASE_CLIENT_ID'],
           ENV['COINBASE_CLIENT_SECRET'],
           sandbox: true
end
