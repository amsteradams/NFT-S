// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/interfaces/IERC165.sol";

contract firstNft is IERC165, ERC721{
 uint private _tokenId;

 constructor(string memory symbol, string memory name)ERC721(symbol, name){
 }

 function mint()public returns(uint){
   _tokenId +=1 ; 
   _mint(msg.sender, _tokenId);
   return _tokenId;
 }

 function tokenURI(uint _tId)override public pure returns(string memory){
   return string(abi.encodePacked("https://gateway.pinata.cloud/ipfs/QmUrP7Qm2YFjFrc7yhKjSFLnNujv68FH4B827Aj5fxP71Y/", Strings.toString(_tId),".json"));
 }
}