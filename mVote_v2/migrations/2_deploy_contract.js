const Ballot = artifacts.require("Ballot");

module.exports = function(deployer) {
  deployer.deploy(Ballot,
    ["Atul Bagga", "Gaurav Saral", "Satish Nankani"],
    "dummyKey");
};
