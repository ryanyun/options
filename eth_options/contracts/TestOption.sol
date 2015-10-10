contract TestOption {
  address buyer;
  address seller;

  function setOptions(address registeredBuyer, address registeredSeller){
    buyer = registeredBuyer;
    seller = registeredSeller;
  }

  function getTime() returns (uint retVal){
    return now;
  }

}