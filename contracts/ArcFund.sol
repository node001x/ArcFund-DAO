// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./interfaces/ISupporterNFT.sol";
contract ArcFund {
struct Campaign { uint256 id; address creator; string title; string description; uint256 goal; uint256 raised; uint256 deadline; bool withdrawn; }
uint256 public campaignCount; ISupporterNFT public nft;
mapping(uint256=>Campaign) public campaigns;
mapping(uint256=>mapping(address=>uint256)) public contributions;
constructor(address nftAddress){ nft=ISupporterNFT(nftAddress); }
function createCampaign(string memory title,string memory description,uint256 goal,uint256 durationDays) external {
campaignCount++; campaigns[campaignCount]=Campaign(campaignCount,msg.sender,title,description,goal,0,block.timestamp+(durationDays*1 days),false);
}
function donate(uint256 id) external payable { Campaign storage c=campaigns[id]; require(msg.value>0); c.raised+=msg.value; contributions[id][msg.sender]+=msg.value; nft.mint(msg.sender); }
function withdraw(uint256 id) external { Campaign storage c=campaigns[id]; require(c.creator==msg.sender); require(c.raised>=c.goal); require(!c.withdrawn); c.withdrawn=true; payable(c.creator).transfer(c.raised); }
function getCampaign(uint256 id) external view returns(Campaign memory){ return campaigns[id]; }
}
