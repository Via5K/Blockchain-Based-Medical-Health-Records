// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0;
contract AccessControl{
    //Owner, the deployer adds the doctors into the database....
    address public owner;

    /**** 
    1. Stores the doctors addresses.
    2. Considered as a database of the Doctors address
    Address here stored are added by the contract owner only.
    ****/
    
    address[] authorisedDoctors;
    mapping (address=>bool)authorisedMap; //Created for easy check

    constructor() {
        owner = msg.sender;
        authorisedDoctors.push(owner);
        authorisedMap[owner]=true;
    }
    
    /**** 
    Checks if the caller of the contract is owner or not?
    If yes, then only proceed to the Function whatever you are doing.
    ****/

    modifier isOwner{
        require(msg.sender==owner,'Opps, You will need to contact the owner');
        _;
    }

    /**** 
    Checks if the caller of the contract is Doctor or Patient?
    If yes, then only proceed to the Function whatever you are doing.
    ****/
    //The address will be sent from metamask.
    modifier onlyDoctor(address _patientAddress){
        //for now i am removing this or COndition. 
        // || msg.sender==_patientAddress 
        require(authorisedMap[msg.sender]==true ,'You are Not authorised to Access the data');
        _;
    }

    

    /**** 
    Updates the doctorsAddress in the database of authorised doctors.
    Along with this, check for the isOwner, if the caller is owner, then only it is allowed to Add the address.
    Parameter passed -
    _doctorAddress
    ****/
    function addAuthorisedDoctor(address _doctorAddress) isOwner public {
        authorisedDoctors.push(_doctorAddress);
        authorisedMap[_doctorAddress] = true;
    }    
}