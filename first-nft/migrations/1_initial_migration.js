const firstNft = artifacts.require("firstNft");

module.exports = function (deployer) {
  deployer.deploy(firstNft);
};
