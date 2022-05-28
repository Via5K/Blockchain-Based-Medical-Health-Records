// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.1;
import './Patients.sol';

contract Medical is Patients{
    struct patientsData{
        string patientName;
        string patientId;
        string patientMobileNumber;
        string patientGender;
        string patientAddress;
        string patientDateOfBirth;
    }
    //stores the doctors addresses considered as a database....
    address[] authorised;
    mapping (address=>bool)authorisedMap;
    //Owner, the deployer adds the doctors into the database....
    address public owner;

    //called once only and stores the address of the deployer.
    constructor() public {
        owner = msg.sender;
        authorised.push(owner);
        authorisedMap[owner]=true;
    }

    //checks for the owner
    modifier isOwner{
        require(msg.sender==owner,'Opps, You will need to contact the owner');
        _;
    }
    
    //only the deployer of the contract can add the addresses in the address array of the doctors.
    function addDoctors(address _doctorAddress) isOwner public {
        authorised.push(_doctorAddress);
        authorisedMap[_doctorAddress] = true;
    }

    function findAuthorised(address caller) private view returns(bool){
        return authorisedMap[caller];
    }

    modifier onlyDoctorOrPatient{
        require(findAuthorised(msg.sender),'You are Not authorised to Access the data');
        _;
    }
}