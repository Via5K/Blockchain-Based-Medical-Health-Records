const AccessControl = artifacts.require("AccessControl");
const Patient = artifacts.require("Patients");
const Doctor = artifacts.require("Doctors");
const Record = artifacts.require("Records");
const GetMedicalInfo = artifacts.require("GetMedicalInfo");
const AddMedicalInfo = artifacts.require("AddMedicalInfo");

module.exports = async function(deployer) {
    await deployer.deploy(AccessControl);
    await deployer.deploy(Patient);
    const patient_ = await Patient.deployed();

    await deployer.deploy(Doctor);
    const doctor_ = await Doctor.deployed();

    await deployer.deploy(Record);
    const record_ = await Record.deployed();

    await deployer.deploy(GetMedicalInfo, patient_.address, doctor_.address, record_.address);

    await deployer.deploy(AddMedicalInfo, patient_.address, doctor_.address, record_.address);

};