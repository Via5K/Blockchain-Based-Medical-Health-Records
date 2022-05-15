window.userWalletAddress = null; //stores the address of the user.
const loginBtn = document.getElementById('loginBtn'); //Button to singin or signout
const userWallet = document.getElementById('userWallet'); //displays the wallet address is found otherwise shows error message.

function toggleButton() {
    //checking if metamask is installed or not?
    if (window.ethereum == undefined) { //if not installed then do the following.
        userWallet.innerText = "Metamask not installed!!";
        loginBtn.style.color = "BLACK";
        return false;
    }
    //otherwise, add an event listener on the login button
    loginBtn.addEventListener('click', loginWithMetamask());
}

async function loginWithMetamask() {
    var accounts; //holds the address of all the accounts of the users in metamsk.
    try { //this will get the list of all the accounts in the metamask of that user...
        accounts = await window.ethereum.request({
            method: 'eth_requestAccounts'
        });
    } catch { //if there is no account, or user cancels the request.
        userWallet.innerText = "Something Went Wrong";
        return;
    }

    if (!accounts) { //if there are no accounts return.
        return;
    }
    window.userWalletAddress = accounts[0]; //set the default wallet as first one.
    userWallet.innerText = window.userWalletAddress; //Setting the paragraph tag in the html to the wallet address that we got from user.
    loginBtn.innerText = "signout"; //Changing the wallet to Signout.
    loginBtn.removeEventListener('click', loginWithMetamask) //Now removing the event listener on login with metamask button.
    setTimeout(() => {
        loginBtn.addEventListener('click', signOutOfMetamask) // and adding the event listener on signout Button.
    }, 200);
}

function signOutOfMetamask() {
    // if we signout, then first make the address of the user = NULL
    window.userWalletAddress = null;
    userWallet.innerText = ""; //change the text to ="";
    loginBtn.innerText = "SignIn with metamask"; // and also the text of button is changed.
    loginBtn.removeEventListener('click', signOutOfMetamask)
    setTimeout(() => {
        loginBtn.addEventListener('click', loginWithMetamask)
    }, 200);
}
toggleButton(); //calling toggleButton that finds the address of the user.