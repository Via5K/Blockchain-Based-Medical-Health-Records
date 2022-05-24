// SPDX-License-Identifier: GPL-3.0



// All the information will be sent here to add the information in the blockchain.

pragma solidity >=0.7.0;
import './Patients.sol';
import './Doctors.sol';

contract AddMedicalInfo{

    //Creating the Contracts instances of Doctor and Patient.
    Patients patient_;
    Doctors doctor_;
    
    constructor(address _patientsContractAddress, address _doctorsContractAddress) {
        //updating the contracts instances with the addresses of the constructor
        patient_ = Patients(_patientsContractAddress);
        doctor_ = Doctors(_doctorsContractAddress);
    }

    /****
        Function addMedicalInfoPatient Updates the information of the patient in the patient contract.
        parameters passed are:
        string patientName
        string patientId
        string patientMobileNumber
        string patientGender
        string patientAddress
        string patientDateOfBirth
        string[] allergiesKnown
    ****/

    //The information in Patient Contract is updated using: patientContractInstance.FunctionName(Parameters);
    function addMedicalInfoPatient(string memory _patientName, string memory _patientId, string memory _patientMobileNumber, string memory _patientGender, string memory _patientAddress, string memory _patientDateOfBirth, string memory _allergiesKnown) public {
        patient_.addPatientName(_patientId, _patientName);
        patient_.addPatientMobileNumber(_patientId, _patientMobileNumber);
        patient_.addPatientGender(_patientId, _patientGender);
        patient_.addPatientAddress(_patientId, _patientAddress);
        patient_.addPatientDateOfBirth(_patientId, _patientDateOfBirth);
        patient_.addPatientAllergies(_patientId, _allergiesKnown);
    } 

    /****
        Function addMedicalInfoDoctor Updates the information of the Doctor in the Doctor contract.
        parameters passed are:
        string doctorName;
        string doctorId;
        string doctorSpeciality;
        string doctorHospital;
        string doctorGender;
    ****/

    //The information in Doctor Contract is updated using: doctorContractInstance.FunctionName(Parameters);
    
    function addMedicalInfoDoctor(string memory _doctorName, string memory _doctorId, string memory _doctorSpeciality, string memory _doctorHospital, string memory _doctorGender) public{
        doctor_.addDoctorName(_doctorId, _doctorName);
        doctor_.addDoctorSpeciality(_doctorId, _doctorSpeciality);
        doctor_.addDoctorHospital(_doctorId, _doctorHospital);
        doctor_.addDoctorGender(_doctorId, _doctorGender);
    }

}








//Additional Information For Help

/****
    //INFORMATION THAT WILLL BE SENT TO THIS CONTRACT ... ADN ITS ORDERING.
    string patientName;
    string patientId;
    string patientMobileNumber;
    string patientGender;
    string patientAddress;
    string patientDateOfBirth;
    string allergiesKnown;


    string doctorName;
    string doctorId;
    string doctorSpeciality;
    string doctorHospital;
    string doctorGender;
    ****/

