contract Option{
  address buyer;
  address seller;
  uint expiration;
  uint asset;
  bytes32 error;

  function setAddresses(address registeredSeller, address registeredBuyer){
    buyer = registeredBuyer;
    seller = registeredSeller;
  }
  function setExpirationTime(uint expirationSeconds){
    expiration = block.timestamp + expirationSeconds;
  }

  function saveAsset(uint assetValue){
    asset = assetValue;
  }

  function createOption(address registeredSeller, address registeredBuyer, uint expirationSeconds, uint assetValue){
    saveAsset(assetValue);
    setAddresses(registeredSeller,registeredBuyer);
    setExpirationTime(expirationSeconds);
  }

  function exercise(){
    if (now > expiration){
      buyer.send(asset);
    }
    else {
      error = "Option has not expired!";
    }
  }


}