var blockapps = require("blockapps-js");
blockapps.query.serverURI = 'http://hacknet.blockapps.net';
var Promise = require("bluebird");
var eth = blockapps.ethbase.Units.unitSchema.ether;
var Solidity = blockapps.Solidity;

function OptionContract () {
  this.contractCode = "contract Option {\n  address buyer;\n  address seller;\n  address self;\n  uint asset;\n  uint expiration;\n\n  function createOption(address registeredSeller, address registeredBuyer, uint assetValue,  uint expirationTimeInSeconds, uint expired){\n    saveAddresses(registeredSeller, registeredBuyer);\n    asset = assetValue;\n    expiration = expirationTimeInSeconds;\n    self = this;\n  }\n\n  function saveAddresses(address registeredSeller, address registeredBuyer) private {\n    seller = registeredSeller;\n    buyer = registeredBuyer;\n  }\n\n  function exercise() returns (uint retInt){\n    if (now >= expiration){\n      // buyer.send(asset)\n      return 1;\n    }\n    else {\n      return 0;\n    }\n  }\n\n  function trade(address newBuyer){\n    buyer = newBuyer;\n  }\n\n  function getExpiration() returns (uint retVal) { return expiration; } \n\n  function getAssetAmount() returns (uint retVal) { return asset; } \n}";
  this.compiledContract = {"code":"contract Option {\n  address buyer;\n  address seller;\n  address self;\n  uint asset;\n  uint expiration;\n\n  function createOption(address registeredSeller, address registeredBuyer, uint assetValue,  uint expirationTimeInSeconds, uint expired){\n    saveAddresses(registeredSeller, registeredBuyer);\n    asset = assetValue;\n    expiration = expirationTimeInSeconds;\n    self = this;\n  }\n\n  function saveAddresses(address registeredSeller, address registeredBuyer) private {\n    seller = registeredSeller;\n    buyer = registeredBuyer;\n  }\n\n  function exercise() returns (uint retInt){\n    if (now >= expiration){\n      // buyer.send(asset)\n      return 1;\n    }\n    else {\n      return 0;\n    }\n  }\n\n  function trade(address newBuyer){\n    buyer = newBuyer;\n  }\n\n  function getExpiration() returns (uint retVal) { return expiration; } \n\n  function getAssetAmount() returns (uint retVal) { return asset; } \n}","name":"Option","vmCode":"606060405261022f806100136000396000f30060606040526000357c010000000000000000000000000000000000000000000000000000000090048063056ba0561461006557806310393dfb14610078578063286f82f9146100a35780633ba5e620146100c4578063d32cb0fe146100e557610063565b005b610076600480359060200150610181565b005b6100a1600480359060200180359060200180359060200180359060200180359060200150610106565b005b6100ae6004506101b0565b6040518082815260200191505060405180910390f35b6100cf6004506101c2565b6040518082815260200191505060405180910390f35b6100f0600450610157565b6040518082815260200191505060405180910390f35b61011085856101d4565b826003600050819055508160046000508190555030600260006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908302179055505b5050505050565b600060046000505442101515610174576001905061017e5661017d565b6000905061017e565b5b90565b80600060006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908302179055505b50565b600060046000505490506101bf565b90565b600060036000505490506101d1565b90565b81600160006101000a81548173ffffffffffffffffffffffffffffffffffffffff0219169083021790555080600060006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908302179055505b505056","symTab":{"createOption":{"functionDomain":[{"atStorageKey":"0","bytesUsed":"14","jsType":"Address","solidityType":"address"},{"atStorageKey":"1","bytesUsed":"14","jsType":"Address","solidityType":"address"},{"atStorageKey":"2","bytesUsed":"20","jsType":"Int","solidityType":"uint256"},{"atStorageKey":"3","bytesUsed":"20","jsType":"Int","solidityType":"uint256"},{"atStorageKey":"4","bytesUsed":"20","jsType":"Int","solidityType":"uint256"}],"functionArgs":["registeredSeller","registeredBuyer","assetValue","expirationTimeInSeconds","expired"],"functionHash":"10393dfb","bytesUsed":"0","jsType":"Function","solidityType":"function(address,address,uint256,uint256,uint256) returns ()"},"asset":{"atStorageKey":"3","bytesUsed":"20","jsType":"Int","solidityType":"uint256"},"expiration":{"atStorageKey":"4","bytesUsed":"20","jsType":"Int","solidityType":"uint256"},"seller":{"atStorageKey":"1","bytesUsed":"14","jsType":"Address","solidityType":"address"},"saveAddresses":{"functionDomain":[{"atStorageKey":"0","bytesUsed":"14","jsType":"Address","solidityType":"address"},{"atStorageKey":"1","bytesUsed":"14","jsType":"Address","solidityType":"address"}],"functionArgs":["registeredSeller","registeredBuyer"],"functionHash":"6bbaaac8","bytesUsed":"0","jsType":"Function","solidityType":"function(address,address) returns ()"},"self":{"atStorageKey":"2","bytesUsed":"14","jsType":"Address","solidityType":"address"},"getAssetAmount":{"functionDomain":[],"functionArgs":[],"functionHash":"3ba5e620","bytesUsed":"0","jsType":"Function","functionReturns":{"atStorageKey":"0","bytesUsed":"20","jsType":"Int","solidityType":"uint256"},"solidityType":"function() returns (uint256)"},"getExpiration":{"functionDomain":[],"functionArgs":[],"functionHash":"286f82f9","bytesUsed":"0","jsType":"Function","functionReturns":{"atStorageKey":"0","bytesUsed":"20","jsType":"Int","solidityType":"uint256"},"solidityType":"function() returns (uint256)"},"trade":{"functionDomain":[{"atStorageKey":"0","bytesUsed":"14","jsType":"Address","solidityType":"address"}],"functionArgs":["newBuyer"],"functionHash":"056ba056","bytesUsed":"0","jsType":"Function","solidityType":"function(address) returns ()"},"exercise":{"functionDomain":[],"functionArgs":[],"functionHash":"d32cb0fe","bytesUsed":"0","jsType":"Function","functionReturns":{"atStorageKey":"0","bytesUsed":"20","jsType":"Int","solidityType":"uint256"},"solidityType":"function() returns (uint256)"},"buyer":{"atStorageKey":"0","bytesUsed":"14","jsType":"Address","solidityType":"address"}}};
  this.privkey = "01e41bcf6371a1d2f6b843a46fb697aff8015e7dbaeef53764a62b9bf7430b87"; 
  this.userAddress = "d2600f116b6c47926ee1f954959506710f50a8f9";
}

OptionContract.prototype.newOptionContract = function(sellerAddress,buyerAddress,amount,expirationTimeInSeconds){
  var self = this;
  Solidity(self.contractCode).call("newContract", self.privkey).then(function(contractObj){
    self.contract = contractObj;
    self.createOption(sellerAddress,buyerAddress,amount,expirationTimeInSeconds);
  });
};

OptionContract.prototype.createOption = function(sellerAddress, buyerAddress,amount,expirationTimeInSeconds){
  var self = this;
  var args = [sellerAddress,buyerAddress,amount,expirationTimeInSeconds,""];
  var etherGas = 2;
  self.contract.state.createOption.apply(null,args).txParams({value : etherGas * eth}).callFrom(self.privkey).then(function(result){
      self.storageAfterTX(result).then(function (contractData) { 
        debugger;
      });
    });
};

OptionContract.prototype.getOptionContract = function(contractAddress){
  this.compiledContract.address = contractAddress;
  this.contract = Solidity.attach(this.compiledContract);
  this.getData();
};

OptionContract.prototype.getData = function(){
  var self = this;
  var args = [];
  var etherGas = 2;
  self.contract.state.getAssetAmount.apply(null,args).txParams({value : etherGas * eth}).callFrom(self.privkey).then(function(result){
      self.storageAfterTX(result).then(function (contractData) { 
        debugger;
      });
    });
};

OptionContract.prototype.storageAfterTX = function(result) {
  var self = this;
  var afterTXstring = {};

  return Promise.props(self.contract.state).then(function(sVars) {
    for (var name in sVars) {
        var svar = sVars[name];
        if (typeof svar === "function") {
            continue;
        }
        afterTXstring[name] = ""+svar;
    }
    return afterTXstring;  
  });
};

