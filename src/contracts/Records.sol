// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.1;
contract Records{
    struct record{
        string lastUpdated;
        string currentMedicalDosage;
        string updatedBy; //doctors id
        string[] currentDiagnosis;
        string PDFreport;
    }

    // function lastUpdated(string _patientId) public {
    //     lastUpdated = block.timestamp;
    // }
    // function getLastUpdated() public{

    // }
}