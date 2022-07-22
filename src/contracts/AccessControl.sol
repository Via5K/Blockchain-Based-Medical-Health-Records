// SPDX-License-Identifier: GPL-3.0

// pragma solidity >=0.7.0;

pragma solidity 0.5.17;

contract AccessControl {
    //Owner, the deployer adds the doctors into the database....
    address public owner;

    /**** 
    1. Stores the doctors addresses.
    2. Considered as a database of the Doctors address
    Address here stored are added by the contract owner only.
    ****/

    // address[] authorisedDoctors;
    mapping(address => bool) public authorisedDoctor; //Created for easy check

    /*****
    This mapping makes sure that whenever a patient tries to access the records,
    then he/she can view the records, though they will still not be able to add the records.
    ******/
    mapping(string => address) public authorisedPatient;

    constructor() public {
        owner = msg.sender;
        // authorisedDoctors.push(owner);
        authorisedDoctor[owner] = true;
    }

    /**** 
    Checks if the caller of the contract is owner or not?
    If yes, then only proceed to the Function whatever you are doing.
    ****/

    modifier isOwner() {
        require(
            msg.sender == owner,
            "Opps, You will need to contact the owner"
        );
        _;
    }
    /**** 
    Checks if the caller of the contract is Doctor or Patient?
    If yes, then only proceed to the Function whatever you are doing.
    ****/
    //The address will be sent from metamask.
    modifier onlyDoctor() {
        require(
            authorisedDoctor[msg.sender] == true,
            "You are Not authorised to Access the data"
        );
        _;
    }

    /**** 
    Checks if the caller of the contract is patient or not?
    If yes, then check if the patientId of that caller is correct or not. If correct then Good,
    Otherwise show the error.
    ****/

    modifier isPatient(string memory _patientId) {
        require(
            authorisedPatient[_patientId] == msg.sender,
            "Ohho! You are not the genuine user, Try accessing your own record mate.."
        );
        _;
    }
    // Special Modifier that check if the record access is being done by the doctor or patient?
    modifier patientModifier(string memory _patientId) {
        require(
            authorisedDoctor[msg.sender] == true ||
                authorisedPatient[_patientId] == msg.sender,
            "You Cannot The Records, You can only access your own records or, You need to be a doctor."
        );
        _;
    }

    /**** 
    Updates the doctorsAddress in the database of authorised doctors.
    Along with this, check for the isOwner, if the caller is owner, then only it is allowed to Add the address.
    Parameter passed -
    _doctorAddress

    Any other doctor can add a new doctor.
    ****/
    function addAuthorisedDoctor(address _doctorAddress) public onlyDoctor {
        authorisedDoctor[_doctorAddress] = true;
    }

    /*****
    RemoveAuthorisedDoctor - Removes the permission of the doctor that was previously assigned the permissions.
    Parameter Passes - 
    _doctorAddress
    Can only be removed by the Owner
    *****/
    function removeAuthorisedDoctor(address _doctorAddress) public isOwner {
        authorisedDoctor[_doctorAddress] = false;
    }
}
