# Blockchain Based Medical Health Records [Blockchain Section]

This Repository is a part of Blockchain based medical health record system, It includes the implementation of Blockchain section only. Full Project with working demo can be viewed here -> https://re-chain.vercel.app

## Blockchain

Records of patients are stored on blockchain which is a decentralised, distributed server. Where no single authority have the power to take down the server. Records are stored all over the internet Using *Ethereum* Blockchain.

## Contracts

Contracts are the programs that are deployed on the ethereum network and are executed whenever someone makes a call to the contract.

Contract calls are made To record and View the patient data.

## Different Contracts Created Adn Usage

* AccessControl - This is used to limit the users from accessing data. As medical records can be misused, This Access Control helps access the records either by the doctor or Patient only.
* GetMedicalInfoAddGet - This contract is used to make call to multiple other contracts functions to fetch and add the information form and to the blockchain. Function GetMedicalInfoDoctor, which calls the contract *Doctor* and Furthermore the functions which fetches the information only. Function AddMedicalInfoDoctor, will send the data to the contract *Doctor* and Furthermore the functions which adds the information only.
* Doctor - Contains the implementation of the Doctor Information.
* Patient - Contains the implementaiton of the Patient Information
* Records -  Contains the implementation of the Record keeping of the patient.

## ABI's

ABI's are json files which helps in interaction with the blockchain through Normal Web. 

## How to be Doctor?

Well you can become doctor by contacting the owner and If you are the owner, you can authorise others to be doctor by accessing: https://re-chain.vercel.app/AdminPanel

Pass the wallet addreess of the user who is going to be the user and you are all set. Make sure you authorise the user twice. So he gets both, Adding as well as viewing permission.


## Future Updates:

1. Patient Have Permission to: Read Only [DONE]
2. Change the contract such that any other doctor can also add a doctor. And simultaneouly, the doctor can give the viewing rights to the patient. This will remove the need of the Owner. [DONE]

## Deployment Information:

Deployed on Goerli Testnet.

## Clean Networks:

truffle networks --clean : removes all the deployments

truffle migrate --reset --network <goerli - N/W Name>: Resets the contract deployment i.e starts from 0 and deploys it on goerli net.

truffle console --network goerli: opens goerli console.


## .env

Contains the Memonic and the address of the testnet.

Format

API_URL = "https://eth-goerli.alchemyapi.io/v2/API_KEY"

MNEMONIC = "privatekey here"

## Deploy

To re-deploy, you will first need to install the requirements.
You should have *Node* installed

`npm install`

### For Local Deployment

1. truffle compile
2. truffle migrate --reset 
3. truffle console
4. Now you will be in console window and you can run commands. See the below section on how to run commands in local deployment.

### For Testnet Deployment

1. truffle compile
2. truffle migrate --reset  --network goerli (here i am using goerli testnet)
3. truffle console --network goerli (to enter into the goerli testnet console)
4. Run the commands just like you ran commands in Local deployment.


## Running Commands in Terminal

first, you have to create a instance of the deployment using `get = await GetMedicalInfo.deployed()`

Now, we can access the GetMedicalInfo contract with the 'get' only. So all the functions can be accessed like this

1. get.addAuthorisedDoctor('address')

Similarly, you can do it for other contracts. and call the functions with `instanceName.functionName('parameter')`

### Giving Access From Terminal (CLI):

Access Nedds to be given for 2 Contracts (AddMedicalInfo & GetMedicalInfo) like this:

get = await GetMedicalInfo.deployed()

add = await AddMedicalInfo.deployed()

get.addAuthorisedDoctor('address')

add.addAuthorisedDoctor('address')
