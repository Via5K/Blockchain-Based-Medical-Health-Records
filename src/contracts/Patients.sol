// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Patients{
    struct patientsInfo{
        string patientName;
        // string patientId;
        string patientMobileNumber;
        string patientGender;
        string patientAddress;
        string patientDateOfBirth;
        string[] allergiesKnown;
    }

    //realtionrelation between a patient id and its details...
    mapping(string=>patientsInfo) patientIdInformation;

    /**** 
    //can be used as uint64
    //patient id (int) (12 digit number : 10digit phone number + 2 random)
    ****/


    /****
    This function adds the patients Names 
    @params _name -  patient name
    @params _patientId - patient'a generated Id.
    ****/
    function addPatientName(string memory _patientId, string memory _name) public{
        // patientIdInformation[_patientId].push(_name);
        patientIdInformation[_patientId].patientName = _name;
    }

    /****
    This function returns the patients Name
    @params _patientId -  patient name
    ****/
    function getPatientName(string memory _patientId) public view returns(string memory){
        return patientIdInformation[_patientId].patientName;
    }

    /****
    This function adds the patients Mobile Number
    @params _patientMobileNumber -  patient Mobile Number
    @params _patientId
    ****/
    function addPatientMobileNumber(string memory _patientId, string memory _patientMobileNumber) public{
        patientIdInformation[_patientId].patientMobileNumber = _patientMobileNumber;
    }

    /****
    This function returns the patients Mobile Number
    @params _patientId
    ****/
    function getPatientMobileNumber(string memory _patientId) public view returns(string memory){
        return patientIdInformation[_patientId].patientMobileNumber;
    }


    /****
    This function adds the Gender of the Patient
    @params _patientGender -  patient Mobile Number
    @params _patientId
    ****/
    function addPatientGender(string memory _patientId, string memory _patientGender) public{
        patientIdInformation[_patientId].patientGender = _patientGender;
    }

    /****
    This function returns the patients Gender
    @params _patientId
    ****/
    function getPatientGender(string memory _patientId) public view returns(string memory){
        return patientIdInformation[_patientId].patientGender;
    }


    /****
    This function adds the patients Address
    @params _patientAddress -  patient Address
    @params _patientId
    ****/
    function addPatientAddress(string memory _patientId, string memory _patientAddress) public{
        patientIdInformation[_patientId].patientAddress = _patientAddress;
    }

    /****
    This function returns the patients Mobile Number
    @params _patientId
    ****/
    function getPatientAddress(string memory _patientId) public view returns(string memory){
        return patientIdInformation[_patientId].patientAddress;
    }


    /****
    This function adds the patients date of birth
    @params _patientMobileNumber -  patient patient date of birth
    @params _patientId
    ****/
    function addPatientDateOfBirth(string memory _patientId, string memory _patientDateOfBirth) public{
        patientIdInformation[_patientId].patientDateOfBirth = _patientDateOfBirth;
    }

    /****
    This function returns the patients date of birth
    @params _patientId
    ****/
    function getPatientDateOfBirth(string memory _patientId) public view returns(string memory){
        return patientIdInformation[_patientId].patientDateOfBirth;
    }


    /****
    This function adds the patients allergies 
    @params _allergy - 
    @params _patientId
    ****/

    function addPatientAllergies(string memory _patientId, string memory _allergy) public{
        patientIdInformation[_patientId].allergiesKnown.push(_allergy);
    }

    /****
    This function returns the patients allergies  
    @params _patientId
    ****/
    function getPatientAllergies(string memory _patientId) public view returns(string[] memory){
        return patientIdInformation[_patientId].allergiesKnown;
    }


}