//abi array needed because remix cannnot guess function names from hash
(async() => {
    const address = "0xf8e81D47203A594245E36C48e151709F0C19fBe8";
    const abiArray = [
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyUint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];

    const contractInstance = new web3.eth.Contract(abiArray, address);

    console.log(await contractInstance.methods.myUint().call());

    let accounts = await web3.eth.getAccounts();
    let txResult = await contractInstance.methods.setMyUint(345).send({from: accounts[0]});

    console.log(await contractInstance.methods.myUint().call());
    console.log(txResult);
})()