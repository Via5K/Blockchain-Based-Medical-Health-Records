// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import './Patients.sol';
import './Doctors.sol';
import './AccessControl.sol';
//all the information will be sent here to get the Information from the blockchain..

contract GetMedicalInfo is AccessControl{

    //Creating the Contracts instances of Doctor and Patient.
    Patients patient_;
    Doctors doctor_;
    
    constructor(address _patientsContractAddress, address _doctorsContractAddress) {
        //updating the contracts instances with the addresses of the constructor
        patient_ = Patients(_patientsContractAddress);
        doctor_ = Doctors(_doctorsContractAddress);
    }

    /****
        Function getMedicalInfoPatient gets the information of the patient in the patient contract.
        parameters passed are:
        string patientId
    ****/

    //The information in Patient Contract is get using: patientContractInstance.FunctionName(Parameters);
    //the address in OnlyDoctor will be sent from the metamsk....
    function getMedicalInfoPatient(string memory _patientId) public view onlyDoctor(msg.sender){
        patient_.getPatientName(_patientId);
        patient_.getPatientMobileNumber(_patientId);
        patient_.getPatientGender(_patientId);
        patient_.getPatientAddress(_patientId);
        patient_.getPatientDateOfBirth(_patientId);
        patient_.getPatientAllergies(_patientId);
    } 

    /****
        Function getMedicalInfoDoctor gets the information of the Doctor in the Doctor contract.
        parameters passed are:
        string doctorId;
    ****/

    //The information in Doctor Contract is retrieved using: doctorContractInstance.FunctionName(Parameters);
    
    function getMedicalInfoDoctor(string memory _doctorId) public view onlyDoctor(msg.sender){
        doctor_.getDoctorName(_doctorId);
        doctor_.getDoctorSpeciality(_doctorId);
        doctor_.getDoctorHospital(_doctorId);
        doctor_.getDoctorGender(_doctorId);
    }
}
