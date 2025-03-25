//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Voting {
    struct Candidate {
      string name;
      uint256 voteCount;
    }
}


address public owner;
mapping(address => bool) public hasVoted;
Candidate[] public candidates;

event Voted(address indexed voter, uint256 candidateIndex);
event CandidateAdded(string name);

modifier onlyOwner() {
  require(msg.sender == owner, "only owner can call this function");
  _;
}

constructor() {
  owner = msg.sender
}

//function that Allows users to vote and validates the voters

function addCandidate(string memory _name) public onlyOwner {
  candidates.push(candidate(_name,0));
  emit CandidateAdded(_name);
}
function vote(uint256 _candidateIndex) public {
  require(!hasVoted[msg.sender], "you have already voted");
  require(_candidateIndex < candidate.length, "invalid candidate index");

  candidates[_candidateIndex].voteCount += 1;
  hasVoted[msg.sender] = True;

  emit Voted(msg.sender, _candidateIndex);
}

//Returns all candidates and their vote counts

function getCandidates() public view returns (Candidate[] memory) {
  return candidates;
}  

//determination of the winner , finds the candidate with most votes

function getWinner() public view returns (string memory winnerName, uint256 winnerVotes) {
  require(candidates.length > 0, "no candidates available");

  uint256 winningVoteCount = 0;
  uint256 winnerIndex = 0;
   
   for (uint256 i = 0, i < candidates.length; i++) {
    if (candidates[i].voteCount  > winningVoteCount) {
        winningVoteCount = candidates[i].voteCount;
        winnerIndex = i;

      }
   }
   return (candidates[winnerIndex].name, candidates[winnerIndex].voteCount);
}