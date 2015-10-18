contract TestOption {
  address buyer;
  address seller;
  uint asset;
  uint expiration;
  // bytes32 error;

  function getTime() returns (uint retVal){
    return now;
  }

  function getOneYear() returns (uint retVal){
    return 1 years;
  }

  function saveAsset(uint assetValue){
    asset = assetValue;
  }

   function createOption(address registeredSeller, address registeredBuyer, uint assetValue,  uint expirationTimeInSeconds){
    seller = registeredSeller;
    buyer = registeredBuyer;
    asset = assetValue;
    expiration = expirationTimeInSeconds;
  }

  function exercise() returns (uint retVal){
    if (now > expiration){
      return 1;
    }
    else {
      return 0;
    }
  }

  function getOptionExpiration() returns (uint retVal){
    return expiration;
  }

}