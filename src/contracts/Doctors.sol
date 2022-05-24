// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Doctors{
    struct doctorInfo{
        string doctorName;
        // string doctorId;
        string doctorSpeciality;
        string doctorHospital;
        string doctorGender;
    }

    mapping(string=>doctorInfo) doctorIdInformation;


    /****
    This function adds the doctors Names 
    @params _name -  doctor name
    @params _doctorId - doctor'a generated Id.
    ****/
    function addDoctorName(string memory _doctorId, string memory _name) public{
        doctorIdInformation[_doctorId].doctorName = _name;
    }

    /****
    This function returns the doctors Name
    @params _doctorId -  doctor name
    ****/
    function getDoctorName(string memory _doctorId) public view returns(string memory){
        return doctorIdInformation[_doctorId].doctorName;
    }

    /****
    This function adds the doctors Names 
    @params _name -  doctor name
    @params _doctorId - doctor'a generated Id.
    ****/
    function addDoctorSpeciality(string memory _doctorId, string memory _speciality) public{
        doctorIdInformation[_doctorId].doctorSpeciality = _speciality;
    }

    /****
    This function returns the doctors Name
    @params _doctorId -  doctor name
    ****/
    function getDoctorSpeciality(string memory _doctorId) public view returns(string memory){
        return doctorIdInformation[_doctorId].doctorSpeciality;
    }
    

    /****
    This function adds the doctors Names 
    @params _name -  doctor name
    @params _doctorId - doctor'a generated Id.
    ****/
    function addDoctorHospital(string memory _doctorId, string memory _hospital) public{
        doctorIdInformation[_doctorId].doctorHospital = _hospital;
    }

    /****
    This function returns the doctors Name
    @params _doctorId -  doctor name
    ****/
    function getDoctorHospital(string memory _doctorId) public view returns(string memory){
        return doctorIdInformation[_doctorId].doctorHospital;
    }
    
    /****
    This function adds the doctors Names 
    @params _name -  doctor name
    @params _doctorId - doctor'a generated Id.
    ****/
    function addDoctorGender(string memory _doctorId, string memory _gender) public{
        doctorIdInformation[_doctorId].doctorGender = _gender;
    }

    /****
    This function returns the doctors Name
    @params _doctorId -  doctor name
    ****/
    function getDoctorGender(string memory _doctorId) public view returns(string memory){
        return doctorIdInformation[_doctorId].doctorGender;
    }

}