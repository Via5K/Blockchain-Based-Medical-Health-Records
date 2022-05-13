// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import './patients.sol';

contract medical{


    struct patientsData{
        string patientName;
        string patientId;
        string patientMobileNumber;
        string patientGender;
        string patientAddress;
        string patientDateOfBirth;
    }
    /**** 
    Gets the data of the patient
    @params _patientId
    ****/
    function getPatientData(string memory _patientId) public view returns(struct){
        patientsData.patientName = getPatientName(_patientId);
        patientsData.patientMobileNumber = getPatientMobileNumber(_patientId);
        patientsData.patientGender = getPatientGender(_patientId);
        patientsData.patientAddress = getPatientAddress(_patientId);
        patientsData.patientDateOfBirth = getPatientDateOfBirth(_patientId);
        patientsData.addPatientAllergies = getPatientAllergies(_patientId);
        return patientsData;
    }
    /**** 
    Adds the data of the patient
    @params _patientId
    ****/
    function addPatientData(string memory _patientId, string memory _name, string memory _address, string memory _mobileNumber, string memory _gender, string[] memory allergies, string memory _dateOfBirth) public {
        addPatientName(_patientId, _name);
        addPatientMobileNumber(_patientId, _mobileNumber);
        addPatientGender(_patientId, _gender);
        addPatientAddress(_patientId, _address);
        addPatientDateOfBirth(_patientId, _dateOfBirth);
        addPatientAllergies(_patientId, allergies);
    }


}