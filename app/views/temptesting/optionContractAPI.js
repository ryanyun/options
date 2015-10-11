
var blockapps = require("blockapps-js");
blockapps.query.serverURI = 'http://hacknet.blockapps.net';
var Promise = require("bluebird");
var eth = blockapps.ethbase.Units.unitSchema.ether;
var Solidity = blockapps.Solidity;

function OptionContract (sellerAddress,buyerAddress,amount,expirationTimeInSeconds) {
  this.contractCode = "contract Option {\n  address buyer;\n  address seller;\n  address self;\n  uint asset;\n  uint expiration;\n\n  function createOption(address registeredSeller, address registeredBuyer, uint assetValue,  uint expirationTimeInSeconds, uint expired){\n    saveAddresses(registeredSeller, registeredBuyer);\n    asset = assetValue;\n    expiration = expirationTimeInSeconds;\n    self = this;\n  }\n\n  function saveAddresses(address registeredSeller, address registeredBuyer) private {\n    seller = registeredSeller;\n    buyer = registeredBuyer;\n  }\n\n  function exercise() returns (uint retInt){\n    if (now >= expiration){\n      // buyer.send(asset)\n      return 1;\n    }\n    else {\n      return 0;\n    }\n  }\n\n  function trade(address newBuyer){\n    buyer = newBuyer;\n  }\n\n  function getExpiration() returns (uint retVal) { return expiration; } \n\n  function getAssetAmount() returns (uint retVal) { return asset; } \n}";
  this.privkey = "01e41bcf6371a1d2f6b843a46fb697aff8015e7dbaeef53764a62b9bf7430b87"; 
  this.userAddress = "d2600f116b6c47926ee1f954959506710f50a8f9";
  alert();
}

OptionContract.prototype.newOptionContract = function(sellerAddress, buyerAddress,amount,expirationTimeInSeconds){
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

