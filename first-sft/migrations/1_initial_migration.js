const sft = artifacts.require("sft");

module.exports = function (deployer) {
  deployer.deploy(sft);
};
