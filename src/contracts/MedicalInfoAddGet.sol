// SPDX-License-Identifier: GPL-3.0
// pragma solidity >=0.7.0;
pragma solidity 0.5.17;
import "./Patients.sol";
import "./Doctors.sol";
import "./AccessControl.sol";
import "./Records.sol";

contract MedicalInfoAddGet is AccessControl {
    //Creating the Contracts instances of Doctor and Patient.
    Patients patient_;
    Doctors doctor_;
    Records record_;

    // constructor(address _patientsContractAddress, address _doctorsContractAddress, address _recordsContractAddress) public {
    constructor(
        Patients _patientsContractAddress,
        Doctors _doctorsContractAddress,
        Records _recordsContractAddress
    ) public {
        //updating the contracts instances with the addresses of the constructor
        patient_ = Patients(_patientsContractAddress);
        doctor_ = Doctors(_doctorsContractAddress);
        record_ = Records(_recordsContractAddress);
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
        and at last adds this user in the authorisedPatient Map, as ID=>ADDRESS
    ****/

    //The information in Patient Contract is updated using: patientContractInstance.FunctionName(Parameters);
    function addMedicalInfoPatient(
        string memory _patientName,
        string memory _patientId,
        // string memory _patientBloodGroup,
        string memory _patientMobileNumber,
        string memory _patientGender,
        string memory _patientAddress,
        string memory _patientDateOfBirth,
        string memory _allergiesKnown,
        // string memory _patientInsurance,
        address _patientWalletAddress
    ) public onlyDoctor {
        patient_.addPatientName(_patientId, _patientName);
        // patient_.addPatientBloodGroup(_patientId, _patientBloodGroup);
        // patient_.addPatientInsurance(_patientId, _patientInsurance);
        patient_.addPatientMobileNumber(_patientId, _patientMobileNumber);
        patient_.addPatientGender(_patientId, _patientGender);
        patient_.addPatientAddress(_patientId, _patientAddress);
        patient_.addPatientDateOfBirth(_patientId, _patientDateOfBirth);
        patient_.addPatientAllergies(_patientId, _allergiesKnown);
        authorisedPatient[_patientId] = _patientWalletAddress;
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

    function addMedicalInfoDoctor(
        string memory _doctorName,
        string memory _doctorId,
        string memory _doctorSpeciality,
        string memory _doctorHospital,
        string memory _doctorGender
    ) public onlyDoctor {
        doctor_.addDoctorName(_doctorId, _doctorName);
        doctor_.addDoctorSpeciality(_doctorId, _doctorSpeciality);
        doctor_.addDoctorHospital(_doctorId, _doctorHospital);
        doctor_.addDoctorGender(_doctorId, _doctorGender);
    }

    /****
        Function addMedicalRecords Updates the information of the Patients Medical record in the Records contract.
        parameters passed are:
        string patientId;
        string lastUpdated;
        string currentMedicalDosage;
        string updatedBy; //doctors id
        string currentDiagnosis;
        string PDFreport;
    ****/

    function addMedicalRecords(
        string memory _patientId,
        string memory _lastUpdated,
        string memory _currentMedicalDosage,
        string memory _updatedBy,
        string memory _currentDiagnosis,
        string memory _PDFreport
    ) public onlyDoctor {
        record_.addLastUpdated(_patientId, _lastUpdated);
        record_.addCurrentMedicalDosage(_patientId, _currentMedicalDosage);
        record_.addUpdatedBy(_patientId, _updatedBy);
        record_.addCurrentDiagnosis(_patientId, _currentDiagnosis);
        record_.addPDFreport(_patientId, _PDFreport);
    }

    /****
        Function getMedicalInfoPatient gets the information of the patient in the patient contract.
        parameters passed are:
        string patientId
    ****/

    //The information in Patient Contract is get using: patientContractInstance.FunctionName(Parameters);
    //the address in OnlyDoctor will be sent from the metamsk....
    //
    function getMedicalInfoPatient(string memory _patientId)
        public
        view
        patientModifier(_patientId)
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            // string memory,
            // string memory,
            string memory
        )
    {
        return (
            patient_.getPatientName(_patientId),
            patient_.getPatientMobileNumber(_patientId),
            patient_.getPatientGender(_patientId),
            patient_.getPatientAddress(_patientId),
            patient_.getPatientDateOfBirth(_patientId),
            // patient_.getPatientBloodGroup(_patientId),
            // patient_.getPatientInsurance(_patientId),
            patient_.getPatientAllergies(_patientId)
        );
    }

    /****
        Function getMedicalInfoDoctor gets the information of the Doctor in the Doctor contract.
        parameters passed are:
        string doctorId;
    ****/

    //The information in Doctor Contract is retrieved using: doctorContractInstance.FunctionName(Parameters);

    function getMedicalInfoDoctor(string memory _doctorId)
        public
        view
        onlyDoctor
        returns (
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        return (
            doctor_.getDoctorName(_doctorId),
            doctor_.getDoctorSpeciality(_doctorId),
            doctor_.getDoctorHospital(_doctorId),
            doctor_.getDoctorGender(_doctorId)
        );
    }

    /****
        Function getMedicalRecords gets the information of the Patients Medical record from the Records contract.
        parameters passed are:
        string patientId;
    ****/

    function getMedicalRecords(string memory _patientId)
        public
        view
        patientModifier(_patientId)
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        return (
            record_.getLastUpdated(_patientId),
            record_.getCurrentMedicalDosage(_patientId),
            record_.getUpdatedBy(_patientId),
            record_.getCurrentDiagnosis(_patientId),
            record_.getPDFreport(_patientId),
            record_.getAllPDFReports(_patientId)
        );
    }
}
