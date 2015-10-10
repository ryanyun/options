contract TestOption {
  address buyer;
  address seller;

  function getTime() returns (uint retVal){
    return now;
  }

  function getOneYear() returns (uint retVal){
    return 1 years;
  }

}