// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccessControl {
    address public admin;
    mapping(address => bool) public collaborators;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not an admin");
        _;
    }

    modifier onlyCollaborator() {
        require(collaborators[msg.sender], "Not a collaborator");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function addCollaborator(address _collaborator) public onlyAdmin {
        collaborators[_collaborator] = true;
    }

    function removeCollaborator(address _collaborator) public onlyAdmin {
        collaborators[_collaborator] = false;
    }
}
