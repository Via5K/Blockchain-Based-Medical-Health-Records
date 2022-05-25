# Storing Files in IPFS
It is done with the help of Web3Storage.

## Dependencies Required
1. Web3Storage = (web3.storage)
2. Minimist = (minimist)

To install these dependencies, ```node i```

## Storing the Information
To store the information, first thing we need is a token, Which will be given to you by the Web3Storage. And the second thing is the file that needs to be stored in the IPFS.

You can upload it using ```node StorePDF.js Filename.pdf``` 
Here, ```StorePDF.js``` is the script where the code is written for Web3Storage.
And, ```Filename.pdf``` is the Document that is needed to be uploaded in the IPFS.

This will return a ```CID``` which is the address of the location where your file has been kept in the IPFS.
This CID is the only key to access the file.

## Retrieving the Information
So, the Information can be retrieved using the CID. 
The Access URL is: ```https://<CID>.ipfs.dweb.link/``` Herein, `<CID>` The CID of the file you want to access is passed.


## Storing the information in the Solidity
From here, the CID will be passsed to the contract, which will then store the CID so that it can be accessed by the Doctor. Easily.
