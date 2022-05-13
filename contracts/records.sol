// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract records{
    struct{
        string lastCheckUpDate;
        string currentMedicalDosage;
        string updatedBy; //doctors id
        string[] currentDiagnosis;
        string PDFreport;
    }

    
}