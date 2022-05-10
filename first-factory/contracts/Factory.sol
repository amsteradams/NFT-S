// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "./Nft.sol";
import "./Sft.sol";


contract Factory{

    mapping(address => uint) amountOfContracts;
    mapping(address => mapping (uint => address)) createdContracts;
    mapping(address => uint) lastCrationTimestamp;

    function deployNft(string memory symbol, string memory name)external{
        if(amountOfContracts[msg.sender] == 0){
            firstNft _contract = new firstNft(symbol, name);
            createdContracts[msg.sender][amountOfContracts[msg.sender]] = address(_contract);
            amountOfContracts[msg.sender] += 1;
        }
        else{
            require(block.timestamp - lastCrationTimestamp[msg.sender] >= 1 days, "you can create a collection only once per day");
            firstNft _contract = new firstNft(symbol, name);
            createdContracts[msg.sender][amountOfContracts[msg.sender]] = address(_contract);
            amountOfContracts[msg.sender] += 1;
        }

    }

    function deploySft(string memory uri)external{
        if(amountOfContracts[msg.sender] == 0){
            sft _contract = new sft(uri);
            createdContracts[msg.sender][amountOfContracts[msg.sender]] = address(_contract);
            amountOfContracts[msg.sender] += 1;
        }
        else{
            require(block.timestamp - lastCrationTimestamp[msg.sender] >= 1 days, "you can create a collection only once per day");
            sft _contract = new sft(uri);
            createdContracts[msg.sender][amountOfContracts[msg.sender]] = address(_contract);
            amountOfContracts[msg.sender] += 1;
        }
    }

    function getMyContractAmount()external view returns(uint){
        return amountOfContracts[msg.sender];
    }

    function getAContract(uint _i)external view returns(address){
        return createdContracts[msg.sender][_i];
    }
}