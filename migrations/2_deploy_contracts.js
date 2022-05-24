const Patient = artifacts.require("Patients");
const Doctor = artifacts.require("Doctors");
// const Record = artifacts.require("Records");

module.exports = async function(deployer) {
    await deployer.deploy(Patient);
    await deployer.deploy(Doctor);
    // await deployer.deploy(Record);
};