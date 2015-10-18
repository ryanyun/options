contract Option {
  address buyer;
  address seller;
  address self;
  uint asset;
  uint expiration;

  function createOption(address registeredSeller, address registeredBuyer, uint assetValue,  uint expirationTimeInSeconds, uint expired){
    saveAddresses(registeredSeller, registeredBuyer);
    asset = assetValue;
    expiration = expirationTimeInSeconds;
    self = this;
  }

  function saveAddresses(address registeredSeller, address registeredBuyer) private {
    seller = registeredSeller;
    buyer = registeredBuyer;
  }

  function exercise() returns (uint retInt){
    if (now >= expiration){
      // buyer.send(asset)
      return 1;
    }
    else {
      return 0;
    }
  }

  function trade(address newBuyer){
    buyer = newBuyer;
  }

  function getExpiration() returns (uint retVal) { return expiration; } 

  function getAssetAmount() returns (uint retVal) { return asset; } 
}