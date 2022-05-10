// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract sft is ERC1155, Ownable{
  using Counters for Counters.Counter;
  Counters.Counter private _tokenId;
  struct Item {
    uint smartness;
    uint height;
    uint maxSupply;
  }

  Item[] Items;

  mapping(uint => uint) public itemSold;
    constructor(string memory uri) ERC1155(uri){
    }

    function supportsInterface(bytes4 interfaceId)public view virtual override(ERC1155) returns(bool){
      return super.supportsInterface(interfaceId);
    }

    function createItem(address _addr, uint _smartness, uint _height, uint _supply)public returns(uint){
      _tokenId.increment();
      Items.push(Item(_smartness, _height, _supply));
      uint _newTokenId = _tokenId.current();
      _mint(_addr, _newTokenId, _supply, "");
      return _newTokenId;
    }

}