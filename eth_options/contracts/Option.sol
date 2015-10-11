contract Option {
  address buyer;
  address seller;
  address self;
  uint asset;
  uint expiration;

  function getTime() returns (uint retVal){
    return now;
  }

  function saveAsset(uint assetValue){
    asset = assetValue;
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
      return 1;
    }
    else {
      return 0;
    }
  }

  function getOptionExpiration() returns (uint retVal){
    return expiration;
  }

  function getContractAddress() returns (address selfAddress){
    return this;
  }

}