// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.1;

contract Records{
    struct medicalRecord{
        string lastUpdated;
        string currentMedicalDosage;
        string updatedBy; //doctors id
        string currentDiagnosis;
        string[] PDFreport;
    }

    mapping(string=>medicalRecord)patientAndRecord;
    /****
    addLastUpdated takes a parameter as input and update the time.
    parameters: 
    _patientId
    _date
    ****/

    function addLastUpdated(string memory _patientId, string memory _date) public {
        //block.timestamp
        patientAndRecord[_patientId].lastUpdated = _date;
    }

    /****
    getLastUpdated takes a parameter as input and update the time.
    parameters: 
    _patientId
    ****/
    
    function getLastUpdated(string memory _patientId) public view returns(string memory){
        return patientAndRecord[_patientId].lastUpdated;
    }

    /****
    currentMedicalDosage takes parameter 
    _patientId
    _dosage
    ****/

    function addCurrentMedicalDosage(string memory _patientId, string memory _currentMedicalDosage) public {
        patientAndRecord[_patientId].currentMedicalDosage = _currentMedicalDosage;
    }

    /****
    getCurrentMedicalDosage takes a parameter and returns the dosage
    parameters: 
    _patientId
    ****/
    
    function getCurrentMedicalDosage(string memory _patientId) public view returns(string memory){
        return patientAndRecord[_patientId].currentMedicalDosage;
    }

    /****
    addupdatedBy() takes parameter 
    _patientId
    _updatedBy which stores the id of the doctor who updates the records.
    ****/

    function addUpdatedBy(string memory _patientId, string memory _updatedBy) public {
        patientAndRecord[_patientId].updatedBy = _updatedBy;
    }

    /****
    getUpdatedBy takes a parameter and returns the id of the doctor
    parameters: 
    _patientId
    ****/
    
    function getUpdatedBy(string memory _patientId) public view returns(string memory){
        return patientAndRecord[_patientId].updatedBy;
    }

    /****
    addCurrentDiagnosis() takes parameter 
    _patientId
    _currentDiagnosis 
    ****/

    function addCurrentDiagnosis(string memory _patientId, string memory _currentDiagnosis) public {
        patientAndRecord[_patientId].currentDiagnosis = _currentDiagnosis;
    }

    /****
    getUpdatedBy takes a parameter and returns the diagonsis that is currently given/ recently.
    parameters: 
    _patientId
    ****/
    
    function getCurrentDiagnosis(string memory _patientId) public view returns(string memory){
        return patientAndRecord[_patientId].currentDiagnosis;
    }

    /****
    addPDFreport() takes parameter 
    _patientId
    _PDFreport which stores the id of the report that is stored in IPFS.
    ****/

    function addPDFreport(string memory _patientId, string memory _PDFreport) public {
        patientAndRecord[_patientId].PDFreport.push(_PDFreport);
    }

    /****
    getPDFreport takes a parameter and returns the report of the patient
    parameters: 
    _patientId
    ****/
    
    function getPDFreport(string memory _patientId) public view returns(string memory){
        return patientAndRecord[_patientId].PDFreport[patientAndRecord[_patientId].PDFreport.length-1];
    }

}