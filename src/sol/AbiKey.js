// Here is deployed contract address
// deployContract Address:   0x0a1DDD72C1D3208EC837E652e04075962011960a
const smartContractAddress = '0x0a1DDD72C1D3208EC837E652e04075962011960a';
// the abi key of smart contract
const AbiKey = [
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "BuyerIsVerified",
		"outputs": [
			{
				"internalType": "bool",
				"name": "verify",
				"type": "bool"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_buyer",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "_seller",
				"type": "address"
			}
		],
		"name": "buyPlot",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_buyer",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "_seller",
				"type": "address"
			}
		],
		"name": "convertionOfBuyerToSeller",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "LandIsVerified",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_buyer",
				"type": "address"
			},
			{
				"internalType": "address",
				"name": "_seller",
				"type": "address"
			}
		],
		"name": "paymentstatus",
		"outputs": [
			{
				"internalType": "bool",
				"name": "",
				"type": "bool"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_cnic",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "registerBuyer",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_key",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "RegisterLand",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "SellerIsVerified",
		"outputs": [
			{
				"internalType": "bool",
				"name": "verify",
				"type": "bool"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "string",
				"name": "MessagE",
				"type": "string"
			}
		],
		"name": "LandPurchaseD",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_cnic",
				"type": "uint256"
			},
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "registerSeller",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "address",
				"name": "BuyerAddresS",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "address",
				"name": "SellerAddresS",
				"type": "address"
			},
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "AmounT",
				"type": "uint256"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "MessagE",
				"type": "string"
			}
		],
		"name": "TransictionRecorD",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "bool",
				"name": "VerifY",
				"type": "bool"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "MessagE",
				"type": "string"
			}
		],
		"name": "VerifiedOrNoT",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "buyer_mapped",
		"outputs": [
			{
				"internalType": "address payable",
				"name": "Key",
				"type": "address"
			},
			{
				"internalType": "string",
				"name": "Name",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "Age",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "City",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "CNIC",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "Email",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "Money",
				"type": "uint256"
			},
			{
				"internalType": "bool",
				"name": "VerificationStatus",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "CurrentLandInspecter",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_landedId",
				"type": "uint256"
			}
		],
		"name": "GetLandArea",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_landedId",
				"type": "uint256"
			}
		],
		"name": "GetLandCity",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_landedId",
				"type": "uint256"
			}
		],
		"name": "GetLandPrice",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "landRegistry_mapped",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "LandedId",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "Area",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "City",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "State",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "LandPrice",
				"type": "uint256"
			},
			{
				"internalType": "bool",
				"name": "LandVerifyStatus",
				"type": "bool"
			},
			{
				"internalType": "address",
				"name": "PropertyPID",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_landedId",
				"type": "uint256"
			}
		],
		"name": "LandsOwner",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "seller_mapped",
		"outputs": [
			{
				"internalType": "address payable",
				"name": "Key",
				"type": "address"
			},
			{
				"internalType": "string",
				"name": "Name",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "Age",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "City",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "CNIC",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "Email",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "Money",
				"type": "uint256"
			},
			{
				"internalType": "bool",
				"name": "VerificationStatus",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]


export default AbiKey;