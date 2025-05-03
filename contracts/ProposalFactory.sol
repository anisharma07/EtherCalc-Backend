// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Proposal} from "./Proposal.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";


contract ProposalFactory {
    error OwnerRestricted();
    error InvalidProposalTime();

    uint public proposalCount;
    address public factoryOwner;
    address[] public allProposals;
    address private immutable proposalGenerator;

    constructor() {
        factoryOwner = msg.sender;
        proposalGenerator = address(new Proposal());
    }
    
    modifier onlyOwner() {
        if (msg.sender != factoryOwner) revert OwnerRestricted();
        _;
    }


    function createProposal(
        Proposal.ProposalInfo memory _proposalInfo
    ) external {
  
        if (_proposalInfo.endTime <= _proposalInfo.startTime) {
            revert InvalidProposalTime();
        }
        address clone = Clones.clone(proposalGenerator);
        Proposal proposal = Proposal(clone);
        proposal.initialize(
                    _proposalInfo,
                    proposalCount,
                    msg.sender
                );
        proposalCount++;
        allProposals.push(address(proposal));

    }

    function getAllProposals() external view returns (address[] memory) {
        return allProposals;
    }
}
