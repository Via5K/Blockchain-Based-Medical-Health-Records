# As of Now, All the contracts are working Fine.
# Deployment is Successfully Done.


## ABI's are created


# TEST WORK
### HTML (creating input Forms)
### HTML (abis sending data)
### HTML (retrieving the data from blokchain)
Successful Retrieving and Updating Data Done.[✅]



# TO CORRECT:
1. AccessControl Contract, OnlyDoctorModifier. : Form other address, if it has been authorised, not able to add the infomration. - Corrected: To Make it correctly work, we need to provide access control for both the contracts, i.e GetMedicalInfo as well as AddMedicalInfo.
   
# IMPROVEMENTS TO BE DONE:
1. Create access control where the doctor have Permission: Read/Write. [✅]
2. Patient Have Permission to: Read Only. []
3. Owner Of the Contract/Deployer of the contract can be the only one to add or remove the doctors Permissions. [✅]
4. Store the report of the patient in IPFS. []
   
