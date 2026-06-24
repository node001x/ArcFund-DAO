// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract DAOManager {
struct Proposal { uint256 campaignId; uint256 yesVotes; uint256 noVotes; uint256 endTime; bool executed; }
uint256 public proposalCount; mapping(uint256=>Proposal) public proposals; mapping(uint256=>mapping(address=>bool)) public hasVoted; mapping(address=>bool) public daoMembers; address public owner;
modifier onlyOwner(){require(msg.sender==owner,"Not owner");_;}
modifier onlyMember(){require(daoMembers[msg.sender],"Not DAO member");_;}
constructor(){owner=msg.sender;}
function addMember(address m) external onlyOwner {daoMembers[m]=true;}
function createProposal(uint256 campaignId) external onlyOwner returns(uint256){ proposalCount++; proposals[proposalCount]=Proposal(campaignId,0,0,block.timestamp+3 days,false); return proposalCount; }
function vote(uint256 id,bool support) external onlyMember { Proposal storage p=proposals[id]; require(block.timestamp<p.endTime); require(!hasVoted[id][msg.sender]); hasVoted[id][msg.sender]=true; if(support)p.yesVotes++; else p.noVotes++; }
}
