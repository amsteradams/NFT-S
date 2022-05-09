// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./royalties.sol";

contract sft is ERC1155, Ownable, Royalties{
  using Counters for Counters.Counter;
  Counters.Counter private _tokenId;
  struct Item {
    uint smartness;
    uint height;
    uint maxSupply;
  }

  Item[] Items;

  mapping(uint => uint) public itemSold;
    constructor() ERC1155("https://gateway.pinata.cloud/ipfs/Qmf6tpDb3YubtXoeezgapkQh1Mh78yA1dLVHXruNwsxc9E/{id}.json"){
    }

    function supportsInterface(bytes4 interfaceId)public view virtual override(ERC1155, Royalties) returns(bool){
      return super.supportsInterface(interfaceId);
    }

    function createItem(address _addr, uint _smartness, uint _height, uint _supply)public returns(uint){
      _tokenId.increment();
      Items.push(Item(_smartness, _height, _supply));
      uint _newTokenId = _tokenId.current();
      _mint(_addr, _newTokenId, _supply, "");
      _setTokenRoyalty(_newTokenId, msg.sender, 1000);
      return _newTokenId;
    }

    function exercise()external{
      createItem(msg.sender, 72, 185, 1);
      createItem(msg.sender, 50, 180, 2000000);
    }
}