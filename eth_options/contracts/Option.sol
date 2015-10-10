contract Option{
  address buyer;
  address seller;
  uint expiration;
  uint asset;
  bytes32 error;

  function createOption(address registeredSeller, address registeredBuyer, uint expirationSeconds, uint assetValue){
    seller = registeredSeller;
    buyer = registeredBuyer;
    expiration = block.timestamp + expirationSeconds;
    asset = assetValue;
  }

  function exercise(){
    if (now > expiration){
      buyer.send(asset);
    }
    else {
      error = "Option has not expired!";
    }
  }

  function getOptionExpiration() returns (uint expiration){
    return expiration;
  }


}