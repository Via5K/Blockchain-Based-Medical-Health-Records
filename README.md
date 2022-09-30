# Blockchain Based Medical Health Records [Blockchain Section]

This Repository is a part of Blockchain based medical health record system, It includes the implementation of Blockchain section only. Full Project with working demo can be viewed at [Re-chain](https://re-chain.vercel.app)

## Doctor Account Access Wallet

**_NOTE_:** this wallet is a publicly shared wallet so do not put any of your personal funds in it. Also, use it only for testing purpose and authorising other accounts to be doctor. To get More testnet Goerli Eth, Use faucets.

*Wallet Address:* 0x26E0C4e0DeaE504f3ea6996D81F5Bc5357AC8A88

*Private Key:* d5e0fc4036a051ea77e0f12470cd5783fc00d58a72642206df2520d7fcf33ac5

Process to Authorise a new doctor.
* Login with the above given account in your metamask
* Now, connect with [re-chain](https://re-chain.vercel.app).
* After this, visit [Admin Panel](https://re-chain.vercel.app/AdminPanel). 
* Put a new address here that you want to authorise to become a doctor & confirm the transaction.
* All done, now you can use the account that you have just authorised as a doctor account and check the [re-chain](re-chain.vercel.app).

## Blockchain

Records of patients are stored on blockchain which is a decentralised, distributed server. Where no single authority have the power to take down the server. Records are stored all over the internet Using *Ethereum* Blockchain.

## Contracts

Contracts are the programs that are deployed on the ethereum network and are executed whenever someone makes a call to the contract.

Contract calls are made To record and View the patient data.

## Different Contracts And Usage

* AccessControl - This is used to limit the users from accessing data. As medical records can be misused, This Access Control helps access the records either by the doctor or Patient only.
* GetMedicalInfoAddGet - This contract is used to make call to multiple other contracts functions to fetch and add the information form and to the blockchain. Function GetMedicalInfoDoctor, which calls the contract *Doctor* and Furthermore the functions which fetches the information only. Function AddMedicalInfoDoctor, will send the data to the contract *Doctor* and Furthermore the functions which adds the information only.
* Doctor - Contains the implementation of the Doctor Information.
* Patient - Contains the implementaiton of the Patient Information
* Records -  Contains the implementation of the Record keeping of the patient.

## ABI's

ABI's are json files which helps in interaction with the blockchain through Normal Web. 

## How to be Doctor?
There are 2 ways to become a Doctor.
* Contact Owner
* Contact Doctor who is already authorised in [Re-Chain](https://re-chain.vercel.app)
Admin Pannel can be accessed by clicking [here](https://re-chain.vercel.app/AdminPanel)

Pass the wallet addreess of the user who is going to be the user and you are all set. 

_Note_ You cannot Un-authorise a user until and unless you are the owner.


## Future Updates:
:) Available to donate blood? (Yes/No) -> try using indexed keyword to search through 

:) Willing to Donate Organs in case of Unfortunate demise? (Yes/No) 

For this Yes/No -> Create seperate pages like, search for Blood Donors, Here, only address along with their blood group will be shown and rest information can be only viewed by doctor.


## Deployment Information:

Current Active Deployment is done on Goerli Network. 
![image](https://user-images.githubusercontent.com/72505269/191512347-b93f5879-7047-4f39-87f1-4fbc754b15c5.png)


Local Deployment is on Localhost.

![image](https://user-images.githubusercontent.com/72505269/191512294-8c6c3db7-0956-4614-ab5b-9bc3ac600b04.png)



#### Clean Networks:

```truffle networks --clean``` : removes all the deployments

```truffle migrate --reset --network <goerli - N/W Name>```: Resets the contract deployment i.e starts from 0 and deploys it on goerli net.

```truffle console --network goerli```: opens goerli console.


### .env

Contains the Memonic and the address of the testnet. Format of same is:

```
API_URL = "https://eth-goerli.alchemyapi.io/v2/API_KEY"

MNEMONIC = "privatekey here"
```

## Deploy

![image](https://user-images.githubusercontent.com/72505269/191513057-efcaf329-5507-4109-b6ec-eab09e560df8.png)


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


## CLI

First, you have to create a instance of the deployment using `get = await Patients.deployed()`

Now, you can access the Patients contract with the 'get' only. So all the functions can be accessed like this

1. `get.addPatientName('Name')`
2. `get.getPatientName('ID')`

Similarly, you can do it for other contracts, and call the functions with `instanceName.functionName('parameter')`

### Authorization from CLI:

Access Needs to be given for that you can simply goto GetMedicalInfoAddGet & authorise.
```get = await GetMedicalInfoAddGet.deployed()```: This will create the instance of GetMedicalInfoAddGet contract.

```get.addAuthorisedDoctor('address')```: This will authorise the user whose address has been passed in the parameter as Doctor.


## Doctor Rights
1. Doctor can add Patients
2. Doctor can add Dcotors
3. Doctor can add/view reports
4. Doctor can view other Doctor

## Creator

Created By [Neeraj](https://github.com/Via5K)

<a href="https://github.com/Via5k/Blockchain-Based-Medical-Health-Records/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Via5k/Blockchain-Based-Medical-Health-Records" />
</a>
