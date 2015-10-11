contract Option {
  address buyer;
  address seller;
  address self;
  uint asset;
  uint expiration;

  function getTime() returns (uint retVal){
    return now;
  }

  function createOption(address registeredSeller, address registeredBuyer, uint assetValue,  uint expirationTimeInSeconds){
    seller = registeredSeller;
    buyer = registeredBuyer;
    asset = assetValue;
    self = this;
    expiration = expirationTimeInSeconds;
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

}