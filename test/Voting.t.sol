// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "src/Voting.sol"; // Ensure this path is correct

contract VotingTest is Test {
    Voting voting;

    function setUp() public {
        voting = new Voting();
    }

    function testAddCandidate() public {
        voting.addCandidate("Alice");
        
        // Fix: Access struct properties correctly
        Voting.Candidate memory candidate = voting.getCandidates()[0];
        assertEq(candidate.name, "Alice");
        assertEq(candidate.voteCount, 0);
    }

      function testVote() public {
        voting.addCandidate("Alice");
        voting.vote(0);
        
        Voting.Candidate memory candidate = voting.getCandidates()[0];
        assertEq(candidate.voteCount, 1);
    }
}