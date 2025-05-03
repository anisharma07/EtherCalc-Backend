// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";

contract Proposal is Initializable {

    struct ProposalInfo {
        uint startTime;
        uint endTime;
        string name;
        string description;
        string sheetKey;
    }

    ProposalInfo public proposalInfo;
    address public factoryContract;
    address public owner;
    uint public proposalId;
    bool public frozen;
    int256 public yesVotes;
    int256 public noVotes;
    mapping(address user => bool isVoted) public votes;

    function initialize(ProposalInfo memory _proposalInfo,
     uint _proposalId,
     address _owner
      ) external initializer {
        proposalInfo = _proposalInfo;
        proposalId = _proposalId;
        owner = _owner;
        factoryContract = msg.sender;
    }

    function freeze() external {
        require(msg.sender == owner, "Only owner can freeze");
        require(block.timestamp >= proposalInfo.startTime, "Election not started");
        frozen = true;
    }

    function vote(bool support) external   {
        require(block.timestamp >= proposalInfo.startTime ||
            block.timestamp <= proposalInfo.endTime, "Election not active");
        require(votes[msg.sender] == false, "Already voted");
        if (support) {
            yesVotes += 1;
        } else {
            noVotes += 1;
        }
        votes[msg.sender] = true;
    }
 }
