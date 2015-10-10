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

   function createOption(address registeredSeller, address registeredBuyer, uint assetValue,  uint expirationSeconds){
    seller = registeredSeller;
    buyer = registeredBuyer;
    asset = assetValue;
    expiration = now + expirationSeconds;
  }

  function exercise() returns (uint retVal){
    if (now > expiration){
      // buyer.send(asset);
      return 1;
    }
    else {
      return 0;
    }
  }

  function getOptionExpiration() returns (uint expiration){
    return expiration;
  }

}