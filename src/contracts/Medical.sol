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
    constructor(){
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
        // authorised[_doctorAddress] = true;
    }

    function findAuthorised(address caller) private view returns(bool){
        //now here traverse in the addresses array and check if we have a match for the address then return true else return false
        return authorisedMap[caller];
    }

    modifier onlyDoctorOrPatient{
        require(findAuthorised(msg.sender),'You are Not authorised to Access the data');
        _;
    }
    
    // /**** 
    // Gets the data of the patient
    // parameters _patientId
    // ****/
    // function getPatientData(string memory _patientId) onlyDoctorOrPatient public view returns(patientsData memory){
    //     //check that if the caller is the doctor or the person itself.
    //     patientsData.patientName = getPatientName(_patientId);
    //     patientsData.patientMobileNumber = getPatientMobileNumber(_patientId);
    //     patientsData.patientGender = getPatientGender(_patientId);
    //     patientsData.patientAddress = getPatientAddress(_patientId);
    //     patientsData.patientDateOfBirth = getPatientDateOfBirth(_patientId);
    //     patientsData.addPatientAllergies = getPatientAllergies(_patientId);
    //     return patientsData;
    // }
    // /**** 
    // Adds the data of the patient
    // parameters _patientId
    // ****/
    // function addPatientData(string memory _patientId, string memory _name, string memory _address, string memory _mobileNumber, string memory _gender, string[] memory allergies, string memory _dateOfBirth) onlyDoctorOrPatient public {
    //     addPatientName(_patientId, _name);
    //     addPatientMobileNumber(_patientId, _mobileNumber);
    //     addPatientGender(_patientId, _gender);
    //     addPatientAddress(_patientId, _address);
    //     addPatientDateOfBirth(_patientId, _dateOfBirth);
    //     addPatientAllergies(_patientId, allergies);
    // }


}



// pragma solidity >=0.7.0 <0.9.0;
// import './Patients.sol';
// import './Doctors.sol';
// //all the information will be sent here to add in the blockchain


// contract Medical{
//     address contractPatient;
//     address contractDoctor;

//     /***
//     Defining the objects of the patients and doctors contract.
//     ***/
//     // struct patientsData{
//     //     string patientName;
//     //     string patientId;
//     //     string patientMobileNumber;
//     //     string patientGender;
//     //     string patientAddress;
//     //     string patientDateOfBirth;
//     // }


//     //set the address of the contracts in state variables

//     function setAddresses(address _patientsAddress, address _doctorsAddress) external{
//         contractDoctor = _doctorsAddress;
//         contractPatient = _patientsAddress;
//     }

//     struct patientsData {
//         string patientName;
//         string doctorName;
//     }

//     string pname;
//     string dname;

//     function callTheFunctions(string memory _patientId, string memory _doctorId, string memory _name, string memory _docName) external returns(patientsData memory){
//         //define the contracts instance varibales.
//         //contractName varibaleName = contractName (address of the contract);
//         patientsData memory patientsData1;
//         Patients patient_ = Patients(contractPatient);
//         Doctors doctor_ = Doctors(contractDoctor);

//         //now we can call the functions of the contracts....
//         //example...
//         //store the name of the patient in the patientsContract
//         patient_.addPatientName(_patientId, _name);
//         pname = patient_.getPatientName(_patientId);
//         patientsData1.patientName = patient_.getPatientName(_patientId);
//         // patientsData.patientName=pname;
//         // return currentPatientName;
//         // return pname;
//         //Now storing the doctors name and getting it.
//         doctor_.addDoctorName(_doctorId, _docName);
//         patientsData1.doctorName = doctor_.getDoctorName(_doctorId);
//         dname = doctor_.getDoctorName(_doctorId);
//         return patientsData1;

//     }
//     /**** 
//     Gets the data of the patient
//     @params _patientId
//     ****/
//     // mapping(uint => patientsData)mix;
//     // function getPatientData(string memory _patientId) public view returns(patientsData memory){
//     //     patientsData.patientName = getPatientName(_patientId);
//     //     patientsData.patientMobileNumber = getPatientMobileNumber(_patientId);
//     //     patientsData.patientGender = getPatientGender(_patientId);
//     //     patientsData.patientAddress = getPatientAddress(_patientId);
//     //     patientsData.patientDateOfBirth = getPatientDateOfBirth(_patientId);
//     //     patientsData.addPatientAllergies = getPatientAllergies(_patientId);
//     //     return patientsData;
//     // }
//     // /**** 
//     // Adds the data of the patient
//     // @params _patientId
//     // ****/
//     // function addPatientData(string memory _patientId, string memory _name, string memory _address, string memory _mobileNumber, string memory _gender, string[] memory allergies, string memory _dateOfBirth) public {
//     //     addPatientName(_patientId, _name);
//     //     addPatientMobileNumber(_patientId, _mobileNumber);
//     //     addPatientGender(_patientId, _gender);
//     //     addPatientAddress(_patientId, _address);
//     //     addPatientDateOfBirth(_patientId, _dateOfBirth);
//     //     addPatientAllergies(_patientId, allergies);
//     // }


// }