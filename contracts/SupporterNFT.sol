// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract SupporterNFT is ERC721, Ownable {
uint256 public nextTokenId; address public crowdfundingContract;
constructor() ERC721("ArcFund Supporter","AFS") {}
function setCrowdfundingContract(address _contract) external onlyOwner { crowdfundingContract=_contract; }
function mint(address to) external { require(msg.sender==crowdfundingContract,"Not authorized"); _safeMint(to,nextTokenId++); }
}
