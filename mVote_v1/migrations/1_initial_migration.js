const ballot = artifacts.require("Ballot");

module.exports = function(deployer) {
  deployer.deploy(ballot);
};
